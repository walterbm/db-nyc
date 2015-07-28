class Foursquare

  FOURSQUARE_CLIENT_ID = ENV["foursquare_client_id"]
  FOURSQUARE_SECRET = ENV["foursquare_secret"]

  def self.request(request_url)
    base_url = "https://api.foursquare.com/v2/"
    api_request = base_url+request_url
    api_response = open(api_request).read
    JSON.parse(api_response)["response"]
  end

  def self.venues
    result = self.request("venues/explore?near=New York NY&client_id=#{FOURSQUARE_CLIENT_ID}&client_secret=#{FOURSQUARE_SECRET}&v=20130815&limit=50")
    venue = Struct.new(:id, :lat, :lng, :checkins)
    result["groups"][0]["items"].collect do |location|
      venue_hash = location["venue"]
      venue.new(venue_hash["id"],venue_hash["location"]["lat"],venue_hash["location"]["lng"],venue_hash["stats"]["checkinsCount"])
    end
  end

  def self.trending
    result = self.request("venues/trending?ll=40.7,-74&client_id=#{FOURSQUARE_CLIENT_ID}&client_secret=#{FOURSQUARE_SECRET}&v=20130815")
    binding.pry
  end

  def self.checkins(venue_id)
    result = self.request("venues/#{venue_id}/herenow?&client_id=#{FOURSQUARE_CLIENT_ID}&client_secret=#{FOURSQUARE_SECRET}&v=20130815")
  end

end