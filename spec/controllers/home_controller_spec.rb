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
    subject{get 'index'}

    it { should have_http_status :success }
  end

  context 'POST generate' do
    before do
      Adjective.create(value: 'Blue')
      Noun.create(value: 'Hat')
      Predicate.create(value: 'Did Something')
      First.create(value: 'First')
      Next.create(value: 'Next')
    end
    %w(whathappens listicle watchas dontwanna).each do |type|
      let(:post_params) { {headline_type: type} }
      subject { post 'generate', post_params }

      it { should have_http_status :success }
      it { should render_template :index }

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
      subject {post 'generate', headline_type: 'dontwanna'}
      it 'listicle should fail because only proper nouns' do
        expect{get 'index'}.to raise_exception
      end
      it 'dontwanna should fail because only proper nouns' do
        expect{subject}.to raise_exception
      end
      it 'works' do
        Noun.create(value: "Hat")
        expect{subject}.not_to raise_exception
      end
    end
    context 'whathappens' do
      before do
        Noun.create(value: 'Hat')
        First.create(value: 'First')
        Next.create(value: 'Next')
      end
      subject { post 'generate', headline_type: 'whathappens'}
      it 'works' do
        subject
        expect(assigns(:headline)).to match /Hat First. What Happened Next Next/
      end
    end
  end

  context 'GET about' do
    it 'works' do
      get 'about'
    end
  end
end