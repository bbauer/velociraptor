class Source::GooglePlus::Client
  def initialize(campaign)
    @campaign = campaign
    @query = @campaign.social_keywords
    GooglePlus.api_key = "AIzaSyA-aBUGmEjBMg_ZTyVw3CfzldPts_aRCyE"
  end

  def search(query=@query)
    return [] unless query.present?

    query.split(",").map do |terms|
      process_search(GooglePlus::Activity.search(terms))
    end.flatten
  end

  def user(id)
    GooglePlus::Person.get(id)
  end

  def activity(id)
    GooglePlus::Activity.get(id)
  end

protected

  def keywords
    google_plus.keywords
  end

  def post(item)
    OpenStruct.new(
      source: "Google Plus",
      content: item.object.content,
      id: item.id,
      url: item.url,
      date: Date.parse(item.published),
      user: item.actor.display_name,
      user_id: item.actor.id,
      user_image: item.actor.image.url
    )
  end

  def google_plus
    @google_plus ||= @campaign.google_plus
  end

  def process_search(search)
    return [] unless search.items

    search.items.map do |item|
      post(item) if item.object.content.present?
    end
  end
end
