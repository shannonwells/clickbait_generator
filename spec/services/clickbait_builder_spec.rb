require 'rails_helper'

describe ClickbaitBuilder do

  let(:type) { nil }

  before do
    %w(A This Some).each { |p| Particle.create!(value: p) }
  end

  describe ".generate" do

    before do
      Adjective.create(value: 'insane')
      Noun.create(value: 'clown')
      Predicate.create(value: 'made a posse')
      Particle.create(value: 'made a posse')
    end

    subject(:clickbait) { described_class.generate(type) }

    it "generates a listicle headline with by default" do
      expect(clickbait.type).to eql 'listicle'
    end

    it "includes a noun, adjective and a predicate" do
      expect(clickbait.headline).to include 'insane'
      expect(clickbait.headline).to include 'clown'
      expect(clickbait.headline).to include 'posse'
    end

    context "whyi" do
      let(:type) { 'whyi' }

      before do
        Verb.create(value: 'gesticulate')
      end

      it "generates a listicle headline with by default" do
        expect(clickbait.type).to eql 'whyi'
      end

      it "includes a noun, adjective and a predicate" do
        expect(clickbait.headline).to include 'insane'
        expect(clickbait.headline).to include 'clown'
        expect(clickbait.headline).to include 'Gesticulate'
      end

    end
  end
end
