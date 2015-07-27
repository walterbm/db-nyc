class NycNoise< ActiveRecord::Base
  validates :latitude, :longitude, presence: true

  def self.convert_to_float
    self.latitude.to_f
    self.longitude.to_f
  end 

  # def hourly_breakout

  # end 

  # def noise_by_type

  # end 

end
