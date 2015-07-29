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

def aggregate_coordinates

end

def grab_9k
  SmarterCSV.process('csv/new_noise_data.csv', {:chunk_size => 9001}) do |chunk|
     chunk.each do |h|
        unless coordinates_empty?(h)
          NycNoise.create(convert(h))
        end
     end
     puts "SAVED 9001 RECORDS INTO THE DATABASE!!!"
     break
   end
end

# Not Ready! Working on Aggregation
# def clean_data_for_db
#   SmarterCSV.process('20150729_all_noise_data_.csv', {:chunk_size => 100}) do |chunk|
#      chunk.each do |h|
#         unless coordinates_empty?(h)
#           NycNoise.create(convert(h))
#         end
#      end
#    end
# end

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

grab_9k

 
