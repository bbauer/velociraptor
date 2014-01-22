class Source::Facebook::Client
  ENDPOINT = "https://graph.facebook.com/search"
  ACCESS_TOKEN = "121584141274833|b0d3826624470f5f5c3e70ce70893ed4"

  def initialize(campaign)
    @campaign = campaign
    @query = @campaign.social_keywords
  end

  def search(query=@query)
    return [] unless query.present?
    query.split(",").map { |terms| query_for(terms) }.flatten
  end

protected

  def request(query)
    uri = URI::encode("#{ENDPOINT}?q=#{query}&access_token=#{ACCESS_TOKEN}")
    JSON.parse(HTTParty.get(uri).body)
  end

  def query_for(terms)
    request(terms).first.second.map { |object| post(object) }
  end

  def post(object)
    OpenStruct.new(
      source: "Facebook",
      content: object["message"],
      id: object["id"],
      url: object["link"],
      date: Date.parse(object["created_time"]),
      user: object["from"]["name"],
      user_id: object["from"]["id"],
      user_image: object["picture"]
    )
  end
end
