require "rails_helper"

describe HomeController, type: :controller do
  include FlickrawWebmocks

  before do
    mock_everything
    %w(A This Some).each { |p| Particle.create!(value: p) }
  end

  context 'GET index' do
    before do
      Adjective.create(value: 'Blue')
      Noun.create(value: 'Hat')
      Predicate.create(value: 'Did Something')
    end
    subject { get 'index' }

    it { should have_http_status :success }
  end

  context 'GET /slackbot/generate' do
    before do
      Adjective.create(value: 'Blue')
      Noun.create(value: 'Lady', is_agent: true)
      Predicate.create(value: 'Did Something')
      First.create(value: 'First')
      Next.create(value: 'Next')
      Verb.create(value: 'Smoke')
    end

    it "works with no argument" do
      get :slackbot_generate
      expect(response).to be_success
      expect(response.body).not_to be_empty
    end

    it "works with a type" do
      get :slackbot_generate, params: { headline: 'whathappens' }
      expect(response).to be_success
      expect(response.body).not_to be_empty
    end

    it "responds with plain text" do
      get :slackbot_generate
      expect(response.header["Content-Type"]).to match(/^text\/plain/)
    end
  end

  context 'POST generate' do
    context 'basic request' do
      before do
        Adjective.create(value: 'Blue')
        Noun.create(value: 'Lady', is_agent: true)
        Predicate.create(value: 'Did Something')
        First.create(value: 'First')
        Next.create(value: 'Next')
        Verb.create(value: 'Smoke')
      end

      %w(whathappens listicle watchas dontwanna).each do |type|
        let(:post_params) { {headline_type: type, format: :json} }

        subject { post 'generate', params: post_params }

        context "as js" do
          it { should have_http_status :success }
        end

        context "as json" do
          it { should have_http_status :success }
          it { should be_a_json_response }
        end

      end
    end
    context 'proper nouns' do
      before do
        Adjective.create(value: 'Blue')
        Noun.create(value: 'Harry', is_proper: true)
        Predicate.create(value: 'Did Something')
        First.create(value: 'First')
        Next.create(value: 'Next')
        Verb.create(value: 'Verb')
      end
      it 'works' do
        Noun.create(value: "Hat")
        expect { post 'generate', params: {headline_type: 'dontwanna', format: :json}  }.not_to raise_exception
      end
    end
  end

  context 'GET about' do
    it 'works' do
      get 'about'
    end
  end
end
