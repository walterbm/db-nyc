class NycNoise< ActiveRecord::Base
  validates :latitude, :longitude, presence: true

  def self.coordinates
    self.select(:latitude, :longitude)
  end

  def self.per_hour(hour)
    self.select(:latitude, :longitude).where('EXTRACT(HOUR FROM created_date) = ?', hour)
  end

  def self.twenty_four
    (0..23).collect do |hour|
      self.per_hour(hour)
    end
  end

end

