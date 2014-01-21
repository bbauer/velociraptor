ACCESS_TOKEN = "CAACEdEose0cBAJ10ZB3hZADaZAz20wZBDrLj0cqWBWQwR8UDwcVtklhJ01Rnl7s4Fm7xjHXtuvZB48lL84D2LIsej9FmJuNyzXZA5T8CqPKoU3hJmBEvM7eglZCr3EBuDayCy9ZBdvqZAxIgNyqDYdiOAQJ5ZBwPK7IO7bufSSk1XLC1ZBaoXnx15869ScFhi8uzaUZD"

class Source::Facebook::Client
  ENDPOINT = "https://graph.facebook.com/search"

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
    uri = "#{ENDPOINT}?q=#{URI::encode(query)}&access_token=#{ACCESS_TOKEN}"
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
      #url: object["actions"].first["link"],
      date: Date.parse(object["created_time"]),
      user: object["from"]["name"],
      user_id: object["from"]["id"],
      user_image: nil
    )
  end
end
