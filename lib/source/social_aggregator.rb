class Source::SocialAggregator
  def initialize(campaign)
    @campaign = campaign
    @twitter = Source::Twitter::Client.new(@campaign)
    @google_plus = Source::GooglePlus::Client.new(@campaign)
    @facebook = Source::Facebook::Client.new(@campaign)
  end

  def aggregate
    (@twitter.search + @google_plus.search + @facebook.search).compact
  end
end
