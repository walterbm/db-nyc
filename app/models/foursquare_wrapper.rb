class FoursquareWrapper

  FOURSQUARE_CLIENT_ID = ENV["foursquare_client_id"]
  FOURSQUARE_SECRET = ENV["foursquare_secret"]

  def self.request(request_url)
    base_url = "https://api.foursquare.com/v2/"
    api_request = URI(URI.encode(base_url+request_url))
    api_response = Net::HTTP.get(api_request)
    JSON.parse(api_response)["response"]
  end

  def self.checkins
    result = self.request("venues/explore?near=New York NY&client_id=#{FOURSQUARE_CLIENT_ID}&client_secret=#{FOURSQUARE_SECRET}&v=20130815&limit=50")
    venue = Struct.new(:latitude, :longitude, :weight)
    result["groups"][0]["items"].collect do |location|
      venue_hash = location["venue"]
      venue.new(venue_hash["location"]["lat"],venue_hash["location"]["lng"],venue_hash["stats"]["checkinsCount"])
    end
  end

  def self.linear_transform_weight(venue)
    1 + (venue.weight-min) * (3-1) / (max-min)
  end

  def self.max
    @@checkins.max_by do |venue|
      venue.weight
    end.weight
  end

  def self.min
    @@checkins.min_by do |venue|
      venue.weight
    end.weight
  end

  @@checkins = self.checkins

  def self.all
    @@checkins.each do |venue|
      venue.weight = linear_transform_weight(venue)
    end
  end

  @@all = self.all

  def self.all_hourly
    (0..23).collect do |hour|
      @@all
    end
  end
  
end