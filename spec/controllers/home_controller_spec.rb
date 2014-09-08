require "rails_helper"

describe HomeController, type: :controller do
  before :all do
    %w(A This Some).each { |p| Particle.create(value: p) }
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
    %w(whathappens listicle ).each do |type|
      let(:post_params) { {type: type} }
      subject { post 'generate', post_params }

      it { should have_http_status :success }
      it { should render_template :index }

    end

    context 'proper nouns' do

    end
    context 'whathappens' do
      before do
        Noun.create(value: 'Hat')
        First.create(value: 'First')
        Next.create(value: 'Next')
      end
    end
  end

  context 'GET about' do
    it 'works' do
      get 'about'
    end
  end
end