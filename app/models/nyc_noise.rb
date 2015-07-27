class NycNoise< ActiveRecord::Base
  validates :latitude, :longitude, presence: true

  def self.convert_to_float
    self.latitude.to_f
    self.longitude.to_f
  end 

end
