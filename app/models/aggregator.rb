class Aggregator

  @@time_independent_data = {"googleplaces" => GoogleplacesWrapper.all_hourly, "foursquare" => FoursquareWrapper.all_hourly, "yelp" => YelpWrapper.new.all_hourly}

  def self.all_twenty_four
    (0..23).collect do |hour|
      NycNoise.per_hour(hour) + @@time_independent_data
    end
  end

  def self.descriptors_twenty_four
    allhash = NycNoise.descriptors.each_with_object({}) do |descriptor, hash|
      hash[descriptor] = NycNoise.twenty_four_by_description(descriptor)
    end
    allhash.merge(@@time_independent_data)
  end

end