require 'spec_helper'

describe Source::Twitter::Client do
  let(:client) { Source::Twitter::Client.new }

  describe "#get" do
    let(:options) { {} }

    subject { client.get(options) }
  end
end
