class Aggregator

  @@time_independent_data = {"googleplaces" => GoogleplacesWrapper.all_hourly, "foursquare" => FoursquareWrapper.all_hourly, "yelp" => YelpWrapper.new.all_hourly}

  def self.descriptors
    NycNoise.descriptors.concat(@@time_independent_data.keys)
  end

  def self.twenty_four_all
    NycNoise.twenty_four
  end

  def self.twenty_four_layer(layer)
    if @@time_independent_data.has_key?(layer)
      @@time_independent_data[layer]
    elsif layer == "All_Data"
      NycNoise.twenty_four
    else
      NycNoise.twenty_four_by_description(layer)
    end
  end

end