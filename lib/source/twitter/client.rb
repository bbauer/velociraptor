class Source::Twitter::Client
  BASE_URI = "https://api.twitter.com"
  VERSION  = "1.1"
  ENDPOINT = "#{BASE_URI}/#{VERSION}/"

  def initialize(campaign)
    @campaign = campaign
    @twitter = @campaign.twitter
    @query = @campaign.social_keywords
  end

  def search(query=@query)
    return [] unless query.present?
    query.split(",").map { |terms| query_for(terms) }.flatten
  end

  def user_timeline
    timeline_for("user_timeline")
  end

  def home_timeline
    timeline_for("home_timeline")
  end

  def mentions_timeline
    timeline_for("mentions_timeline")
  end

  def retweets_of_me
    timeline_for("retweets_of_me")
  end

  def all_timelines
    user_timeline + home_timeline + mentions_timeline + retweets_of_me
  end

protected

  def request(resource)
    JSON.parse(access_token.request(:get, resource).body)
  end

  def query_for(terms)
    response = request("#{ENDPOINT}search/tweets.json?q=#{URI::encode(terms)}")
    response.first.second.collect { |tweet| tweet["text"] }
  end

  def timeline_for(type)
    request("#{ENDPOINT}statuses/#{type}.json").collect { |t| t["text"] }
  end

  def consumer
    OAuth::Consumer.new(@twitter.api_key, @twitter.api_secret, twitter_defaults)
  end

  def twitter_defaults
    { site: "http://api.twitter.com", scheme: :header }
  end

  def token_hash
    { oauth_token: @twitter.oauth_token, oauth_token_secret: @twitter.oauth_secret }
  end

  def access_token
    @paccess_token ||= OAuth::AccessToken.from_hash(consumer, token_hash)
  end
end
