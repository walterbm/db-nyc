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

  def self.coordinates
    self.select(:latitude, :longitude)
  end


  # # def self.hourly_breakout
  # # result = self.request("URL_HERE")
  # # created_date: "2015-07-26 13:50:00 -0400"
  # NycNoise.having()
  # end 

  # def noise_by_type
  # result = self.request("URL_HERE")
  # end 

end

