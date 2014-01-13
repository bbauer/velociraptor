class Source::Twitter::Client
  BASE_URI = "https://api.twitter.com/1.1/"
  SEARCH = "search/tweets.json"
  PUBLIC = "http://twitter.com/"

  def initialize(client)
    @client = client
  end

  def search(query)
    request("#{SEARCH}?q=#{query}")
  end

  def timeline(status='friends')
    HTTParty.get("#{PUBLIC}statuses/#{status}_timeline.json", options)
  end

protected

  def request(resource)
    JSON.parse(HTTParty.get("#{BASE_URI}#{resource}", options))
  end

  def auth
    { username: twitter.username, password: twitter.password }
  end

  def options
    { basic_auth: auth }
  end

  def twitter
    @twitter ||= @client.twitter
  end
end
