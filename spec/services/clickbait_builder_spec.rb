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
      Verb.create(value: 'gesticulate')
      First.create(value: 'First')
      Next.create(value: 'Next')
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

      it "generates a whyi click bait" do
        expect(clickbait.type).to eql 'whyi'
      end

      it "includes a conjugated verb" do
        expect(clickbait.headline).to include('gesticulate'.verb.conjugate(subject: "I", tense: :past, person: :first, aspect: :perfective).titleize)
        expect(clickbait.headline).to include 'insane'
        expect(clickbait.headline).to include 'clown'
      end

    end

    context 'dontwanna' do
      let(:type) { 'dontwanna' }

      before do
        Noun.create(value: 'proper', is_proper: true)
      end

      it "generates a dontwanna click bait" do
        expect(clickbait.type).to eql 'dontwanna'
      end

      it "includes the word don't" do
        expect(clickbait.headline).to match /don\'t/i
      end

      it "includes the verb" do
        expect(clickbait.headline).to match 'gesticulate'
      end

      it "uses the non proper noun" do
        expect(clickbait.headline).to include 'clown'
        expect(clickbait.headline).not_to include 'proper'
      end
    end

    context 'whathappens' do
      let(:type) { 'whathappens' }
      before do
        Noun.create(value: 'whatever', is_agent: true)
      end

      it "generates a whathappens click bait" do
        expect(clickbait.type).to eql 'whathappens'
      end

      it "includes a first and next and uses an agent noun" do
        expect(clickbait.headline).to match /Next/
        expect(clickbait.headline).to match /First/
        expect(clickbait.headline).to match /whatever/
      end
    end

    context 'watchas' do
      let(:type) { 'watchas' }

      before do
        Noun.create(value: 'blurp', is_agent: true)
      end

      it "generates a watches click bait" do
        expect(clickbait.type).to eql 'watchas'
      end

      it "includes an agent noun and a non agent noun and the verb and adjective" do
        expect(clickbait.headline).to match 'Blurp'
        expect(clickbait.headline).to match 'insane'
        expect(clickbait.headline).to match 'gesticulate'.verb.conjugate(subject: 'blurp').titleize
      end
    end

  end
end
