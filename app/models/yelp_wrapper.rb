class YelpWrapper
  attr_reader :client

  KEYWORDS = ['noisy', 'loud', 'loudest', 'ear-splitting']

  def initialize
    binding.pry
    @client = Yelp::Client.new(
      { consumer_key: ENV['yelp_consumer_key'],
        consumer_secret: ENV['yelp_consumer_secret'],
        token: ENV['yelp_token'],
        token_secret: ENV['yelp_token_secret']
      })
    all
  end

  def all
    @all = KEYWORDS.each_with_object([]) { |keyword, arr|
      search(keyword, arr)
    }
  end

  def all_hourly
    (0..23).collect do |hour|
      @all
    end
  end

  def search(keyword, arr)
    result = self.client.search('New York', {term: keyword}).businesses
    business = Struct.new(:latitude, :longitude, :weight)
    result.each do |b|
      if (!(/#{keyword}/.match(b.id)))
        arr << business.new(b.location.coordinate.latitude, b.location.coordinate.longitude, 2)
      end
    end
  end
end