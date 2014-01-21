class Source::SocialAggregator
  def initialize(campaign)
    @campaign = campaign
  end

  def aggregate
    twitter + google_plus + facebook
  end

  def twitter
    Source::Twitter::Client.new(@campaign).search.compact
  end

  def google_plus
    Source::GooglePlus::Client.new(@campaign).search.compact
  end

  def facebook
    Source::Facebook::Client.new(@campaign).search.compact
  end
end
