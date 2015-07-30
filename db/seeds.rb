# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'chronic'
require 'csv'  
require 'pry'


ROWS_TO_KEEP = [:created_date,:closed_date,:complaint_type,:descriptor,:city,:borough,:latitude,:longitude]
RAW_CSV_FILES = ["311_Service_Requests_from_2015_to_082015.csv"]
  # "311_Service_Requests_from_2010_to_2011.csv",
  # "311_Service_Requests_from_2011_to_2012.csv",
  # "311_Service_Requests_from_2012_to_2013.csv",
  # "311_Service_Requests_from_2013_to_2014.csv",
  # "311_Service_Requests_from_2014_to_2015.csv",
  # ]

def grab_all
  RAW_CSV_FILES.each do |file_path|
    clean_and_save_data(file_path)
  end
end

def grab_9999
  row_counter = 0
  SmarterCSV.process('csv/311_Service_Requests_from_2015_to_082015.csv') do |array|
    row_hash = array.first
    unless coordinates_empty?(row_hash)
      row_counter == 9999 ? break : row_counter += 1
      NycNoise.create(convert(row_hash))
    end
  end
  puts "saved #{row_counter} records into database!"
end

def clean_and_save_data(file_path)
  SmarterCSV.process("csv/#{file_path}") do |array|
      row_hash = array.first
      unless coordinates_empty?(row_hash)
        NycNoise.create(convert(row_hash))
      end
   end
   puts "saved #{file_path} into database!"
end

def remove_unused_col(raw_row)
  raw_row.delete_if do |key, value|
    !ROWS_TO_KEEP.include?(key)
  end
end

def convert(raw_row)
  selected_hash = remove_unused_col(raw_row)
  selected_hash[:created_date] = Chronic.parse(selected_hash[:created_date])
  selected_hash[:closed_date] = Chronic.parse(selected_hash[:closed_date])
  selected_hash
end

def coordinates_empty?(raw_row)
  (raw_row[:latitude].nil? && raw_row[:longitude].nil?)
end

grab_9999

 
