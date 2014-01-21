class Source::Facebook::Client
  ACCESS_TOKEN = "CAACEdEose0cBALsiP970u8O4IQRLPORinZBTl1ZBRwjUy7NVc1nfeoC1pqIZCFsJgddG9Obn2Vtu8h5vNlnGsUhtY7w4nrvIVhzSa6eEkbGS1s5wLN9iWLFFXxbsDaaXaH7ZCzC2bEg6UChS6zRqsFbvzR3veFbFm4mUuVeZBQAAZBohwVzN2wGELsdRorxvoZD"
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
      url: object["link"],
      date: Date.parse(object["created_time"]),
      user: object["from"]["name"],
      user_id: object["from"]["id"],
      user_image: object["picture"]
    )
  end
end
