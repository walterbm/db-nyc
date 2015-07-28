class NycNoise< ActiveRecord::Base
  validates :latitude, :longitude, presence: true

  # def self.request(request_url)
  #   base_url = ""
  #   api_request = base_url + request_url
  #   api_response = open(api_request).read
  #   JSON.parse(api_response)["response"]
  # end   

  def self.convert_to_float
    self.latitude.to_f
    self.longitude.to_f
  end 

  # def self.hourly_breakout
  # result = self.request("URL_HERE")
  
  # end 

  # def noise_by_type
  # result = self.request("URL_HERE")

  # end 

end

