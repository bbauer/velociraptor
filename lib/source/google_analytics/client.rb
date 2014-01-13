class Source::GoogleAnalytics::Client
  START_DATE = Date.today.strftime("%Y-%m-%d")
  END_DATE = Date.today.strftime("%Y-%m-%d")
  DIMENSIONS = "browser"

  def initialize(client)
    @client = client
  end

  def get(options)
    google_analytics.get(
      start_date: options[:start_date] || START_DATE,
      end_date: options[:end_date] || END_DATE,
      dimensions: [options[:dimensions] || DIMENSIONS],
      metrics: [options[:metrics]],
      sort: [options[:sort]]
    )
  end

  def magaged_accounts
    HTTParty.get("https://www.googleapis.com/analytics/v3/management/accounts", options)
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
    #Velociraptor::Application.config.google_analytics_token
    "AIzaSyA-aBUGmEjBMg_ZTyVw3CfzldPts_aRCyE"
  end

  def auth
    { username: source.email, password: source.password }
  end

  def options
    { basic_auth: auth }
  end

  def password
    "notasecret"
  end

  def client_id
    "846421549419.apps.googleusercontent.com"
  end
end
