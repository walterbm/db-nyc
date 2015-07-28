class YelpClient
  attr_reader :client

  KEYWORDS = ['noisy', 'loud']

  def initialize
    @client = Yelp::Client.new(
      { consumer_key: ENV['yelp_consumer_key'],
        consumer_secret: ENV['yelp_consumer_secret'],
        token: ENV['yelp_token'],
        token_secret: ENV['yelp_token_secret']
      })
  end

  def businesses
    result = self.client.search('New York', {term: 'noisy'}).businesses
    business = Struct.new(:id, :lat, :lng)
    result.collect do |b|
      business.new(b.id, b.location.coordinate.latitude, b.location.coordinate.longitude)
    end
  end
end