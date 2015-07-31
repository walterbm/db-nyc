class Aggregator

  @@time_independent_data_hourly = {"googleplaces" => GoogleplacesWrapper.all_hourly, "foursquare" => FoursquareWrapper.all_hourly, "yelp" => YelpWrapper.new.all_hourly}
  @@time_independent_data_single = GoogleplacesWrapper.all + FoursquareWrapper.all + YelpWrapper.new.all
  def self.descriptors
    NycNoise.descriptors.concat(@@time_independent_data_hourly.keys)
  end

  def self.twenty_four_all
    NycNoise.twenty_four
  end

  def self.twenty_four_layer(layer)
    if @@time_independent_data_hourly.has_key?(layer)
      @@time_independent_data_hourly[layer]
    elsif layer == "All_Data"
       (0..23).collect do |hour|
          NycNoise.per_hour(hour) + @@time_independent_data_single 
        end
    else
      NycNoise.twenty_four_by_description(layer)
    end
  end

end