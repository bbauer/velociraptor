class Source::SocialDataManager
  CACHE_EXPIRATION = 7.days

  def initialize(campaign)
    @campaign = campaign
  end

  def fetch_data
    if cached_data = read_cache
      cached_data
    else
      write_cache
      read_cache
    end
  end

  def refresh_data
    reset_cache
    write_cache
  end

protected

  def read_cache
    Rails.cache.read(key)
  end

  def reset_cache
    Rails.cache.write(key, nil, expires_in: CACHE_EXPIRATION)
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
