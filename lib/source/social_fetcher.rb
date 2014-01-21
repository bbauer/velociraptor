class Source::SocialFetcher
  CACHE_EXPIRATION = 3.hours

  def initialize(campaign)
    @campaign = campaign
  end

  def fetch
    if cached_data = read_cache
      cached_data
    else
      write_cache
      read_cache
    end
  end

protected

  def read_cache
    Rails.cache.read(key)
  end

  def write_cache
    Rails.cache.write(key, data, expires_in: CACHE_EXPIRATION)
  end

  def key
    @key ||= "#{@campaign.id}_social_posts"
  end

  def data
    Source::SocialAggregator.new(@campaign).aggregate
  end
end
