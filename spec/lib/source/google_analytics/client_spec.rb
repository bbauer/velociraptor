require 'spec_helper'

describe Source::GoogleAnalytics::Client do
  let(:client) { Source::GoogleAnalytics::Client.new }

  describe "#get" do
    let(:options) { {} }

    subject { client.get(options) }
  end
end
