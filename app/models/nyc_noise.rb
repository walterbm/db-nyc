class NycNoise< ActiveRecord::Base
  validates :latitude, :longitude, presence: true

  def self.convert_to_float
    self.latitude.to_f
    self.longitude.to_f
  end 

  def self.convert_to_dt
    self.created_date.gsub(/\/..$/, '2015')
    self.created
  end 

end
