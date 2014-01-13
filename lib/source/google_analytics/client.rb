class Source::GoogleAnalytics::Client
  START_DATE = Date.today
  END_DATE = Date.today
  DIMENSIONS = "browser"

  def initialize(client)
    @client = client
  end

  def get(options)
    google_analytics.get(
      start_date: options[:start_date] || START_DATE,
      end_date: options[:end_date] || END_DATE,
      dimensions: options[:dimensions] || DIMENSIONS,
      metrics: options[:metrics],
      sort: options[:sort]
    )
  end

protected

  def google_analytics
    Gattica.new(
      token: token,
      email: source.email,
      password: source.password,
      profile_id: source.profile_id
    )
  end

  def source
    @source ||= @client.google_analytics
  end

  def token
    Velociraptor::Application.config.google_analytics_token
  end
end
