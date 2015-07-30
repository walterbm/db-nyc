class GoogleplacesWrapper

  GP_KEY = ENV["googleplaces_key"]

  def self.request(request_url)
    base_url = "https://maps.googleapis.com/maps/api/place/"
    api_request = base_url+request_url
    api_response = open(api_request).read
    JSON.parse(api_response)["results"]
  end

  def self.all
    result = self.request("nearbysearch/json?" + "location=40.7731295,-73.957734" + "&radius=19000" + "&types=hospital" + "&key=" + GP_KEY)
    hospital = Struct.new(:latitude, :longitude, :weight)
    result.collect do |location|
      hospital.new(location["geometry"]["location"]["lat"],location["geometry"]["location"]["lng"],4)
    end
  end

end

