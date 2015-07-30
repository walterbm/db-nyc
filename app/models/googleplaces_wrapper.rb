class GoogleplacesWrapper

  GP_KEY = ENV["googleplaces_key"]

  def self.request(request_url)
    base_url = "https://maps.googleapis.com/maps/api/place/"
    api_request = base_url+request_url
    api_response = open(api_request).read
    JSON.parse(api_response)
  end

  def self.hospitals
    result = self.request("nearbysearch/json?" + "location=40.7731295,-73.957734" + "&radius=19000" + "&types=hospital" + "&key=" + GP_KEY)
    hospital = Struct.new(:id, :lat, :lng)
    hospitals = []
    result["geometry"]["location"].each.with_index do |p,i|
      hospitals << hospital.new(i, p["lat"], p["lng"])
    end   
  end

end

