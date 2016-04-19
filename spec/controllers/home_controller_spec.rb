require "rails_helper"

describe HomeController, type: :controller do
  before do
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
      get :slackbot_generate, text: 'whathappens'
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
        let(:format) { :js }
        let(:post_params) { {headline_type: type, format: format} }

        subject { post 'generate', post_params }

        context "as js" do
          it { should have_http_status :success }
          it { should render_template :generate }
        end

        context "as json" do
          let(:format) { :json }
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
      it 'listicle should fail because only proper nouns' do
        expect { get 'generate', headline_type: 'listicle', format: :js }.to raise_exception NoMethodError
      end
      it 'dontwanna should fail because only proper nouns' do
        expect { post 'generate', headline_type: 'dontwanna', format: :js  }.to raise_exception NoMethodError
      end
      it 'works' do
        Noun.create(value: "Hat")
        expect { post 'generate', headline_type: 'dontwanna', format: :js  }.not_to raise_exception
      end
    end
  end

  context 'GET about' do
    it 'works' do
      get 'about'
    end
  end
end
