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

# original = CSV.read('csv/noise_nyc.csv', { headers: true, return_headers: true })
# original.delete("Closed Date")

CSV.foreach("csv/noise_nyc.csv", :headers => true) do |row|
  keys = row.to_hash.keys.map {|key| key.gsub(' ','_').downcase }
  values = row.to_hash.map do |k, value| 
    (k == "created_date" || k == "closed_date") ? Chronic.parse(value) : value
  end 
  hash = Hash[keys.zip(values)]
  NycNoise.create(hash)
end

 
