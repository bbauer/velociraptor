require "spec_helper"

describe ApplicationHelper do
  describe "#icon" do
    let(:icon_class) { "fa-cogs" }
    let(:text) { "Link" }

    subject { icon(icon_class, text) }

    it { should eq("<i class='fa #{icon_class}'></i> #{text}") }
  end
end
