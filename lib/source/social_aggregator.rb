class Source::SocialAggregator
  def initialize(campaign)
    @campaign = campaign
    @twitter = Source::Twitter::Client.new(@campaign)
    @google_plus = Source::GooglePlus::Client.new(@campaign)
  end

  def aggregate
    twitter_posts + google_plus_posts
  end

protected

  def twitter_posts
    @twitter.search.map { |item| { source: "Twitter", content: item } }
  end

  def google_plus_posts
    @google_plus.search.map { |item| { source: "Google Plus", content: item } }
  end
end
