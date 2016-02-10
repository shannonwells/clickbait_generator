require 'rails_helper'

describe ClickbaitSerializer do

  let(:clickbait) { Clickbait.new headline: 'rock the house', type: 'listicle' }
  subject(:serializer) { described_class.new(clickbait) }
  it "serializes clickbaits" do
    expect(serializer.to_json).to eql({ clickbait: { headline: clickbait.headline, type: clickbait.type } }.to_json)
  end

end
