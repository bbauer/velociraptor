class Source::GooglePlus::Client
  def initialize(campaign)
    @campaign = campaign
    @query = @campaign.social_keywords
    GooglePlus.api_key = "AIzaSyA-aBUGmEjBMg_ZTyVw3CfzldPts_aRCyE"
  end

  def search(query=@query)
    return [] unless query.present?
    query.split(",").map { |terms| process_search(GooglePlus::Activity.search(terms)) }.flatten
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

  def google_plus
    @google_plus ||= @campaign.google_plus
  end

  def process_search(search)
    search.items.map do |item|
      if item.object.content.present?
        item.object.content
      else
        item.object.attachments.first["content"]
      end
    end
  end
end
