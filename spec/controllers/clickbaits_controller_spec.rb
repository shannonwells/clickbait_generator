require 'rails_helper'

describe ClickbaitsController, type: :controller do
  let(:headline) { "something hilarious" }

  describe 'create' do
    subject { post :create, params: {clickbait: { headline: headline, headline_type: 'listicle' } , format: :json }}

    it 'creates a new clickbait' do
      expect { subject }.to change{ Clickbait.count }.by 1
    end

    it 'has the headline we supplied' do
      subject
      expect(assigns[:clickbait].headline).to eql headline
    end

    it 'is successful' do
      subject
      expect(response).to be_success
    end
  end

end
