# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'  
require 'pry'

CSV.foreach("csv/noise_nyc.csv", :headers => true) do |row|
  keys = row.to_hash.keys.map {|key| key.gsub(' ','_').downcase }
  values = row.to_hash.values
  hash = Hash[keys.zip values]
  NycNoise.create(hash)
end
