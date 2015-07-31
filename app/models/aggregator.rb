class Aggregator

  @@time_independent_data = {"googleplaces" => GoogleplacesWrapper.all_hourly, "foursquare" => FoursquareWrapper.all_hourly, "yelp" => YelpWrapper.new.all_hourly}

  def self.descriptors_twenty_four
    allhash = NycNoise.descriptors.each_with_object({}) do |descriptor, hash|
      hash[descriptor] = NycNoise.twenty_four_by_description(descriptor)
    end
    allhash.merge(@@time_independent_data)
  end

  def self.twenty_four_all
    NycNoise.twenty_four
  end

  def self.twenty_four_layer(layer)
    if @@time_independent_data.has_key?(layer)
      @@time_independent_data[layer]
    else
      {layer => NycNoise.twenty_four_by_description(layer)}
    end
  end

end