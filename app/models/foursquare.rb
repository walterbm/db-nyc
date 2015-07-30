class Foursquare

  FOURSQUARE_CLIENT_ID = ENV["foursquare_client_id"]
  FOURSQUARE_SECRET = ENV["foursquare_secret"]

  def self.request(request_url)
    base_url = "https://api.foursquare.com/v2/"
    api_request = base_url+request_url
    api_response = open(api_request).read
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

  @@checkins = self.checkins

  def self.all
    @@checkins.each do |venue|
      venue.weight = linear_transform_weight(venue)
    end
  end
  
  def self.linear_transform_weight(venue)
    2 + (venue.weight-min) * (6-2) / (max-min)
  end

  private

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

end