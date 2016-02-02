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
        let(:post_params) { {headline_type: type, format: :js} }
        subject { post 'generate', post_params }

        it { should have_http_status :success }
        it { should render_template :generate }

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
        expect { get 'generate', headline_type: 'listicle', format: :js }.to raise_exception
      end
      it 'dontwanna should fail because only proper nouns' do
        expect { post 'generate', headline_type: 'dontwanna', format: :js  }.to raise_exception
      end
      it 'works' do
        Noun.create(value: "Hat")
        expect { post 'generate', headline_type: 'dontwanna', format: :js  }.not_to raise_exception
      end
    end
    context 'whathappens' do
      before do
        Noun.create(value: 'Lady', is_agent: true)
        First.create(value: 'First')
        Next.create(value: 'Next')
        Adjective.create(value: 'Blue')
        Predicate.create(value: 'Did Something')
        Verb.create(value: 'Smoke')
      end
      subject { post 'generate', headline_type: 'whathappens', format: :js }
      it 'works' do
        subject
        expect(assigns(:headline)).to match /Lady. What Happened Next/
      end
    end
  end

  context 'GET about' do
    it 'works' do
      get 'about'
    end
  end
end