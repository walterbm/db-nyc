class GoogleplacesWrapper

  GP_KEY = ENV["googleplaces_key"]

  def self.request(request_url)
    base_url = "https://maps.googleapis.com/maps/api/place/"
    api_request = base_url+request_url
    api_response = open(api_request).read
    JSON.parse(api_response)
  end

  def self.hospitals
    
  end


end