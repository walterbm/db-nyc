class Aggregator

  @@time_independent_data = GoogleplacesWrapper.all + FoursquareWrapper.all #+ YelpWrapper.new.all

  def self.all_twenty_four
    (0..23).collect do |hour|
      NycNoise.per_hour(hour)+@@time_independent_data
    end
  end

end