require 'rails_helper'

describe PermalinksController, type: :controller do
  let(:headline) { "something hilarious" }
  describe 'show' do
    let(:permalink) {Permalink.create headline: headline}

    before do
      get :show, id: permalink.id
    end

    it 'sets a title' do
      expect(assigns(:permalink).headline).to eql headline
    end
    it 'is successful' do
      expect(response).to be_success
    end
  end

  describe 'create' do
    subject { post :create, permalink: { title: headline } , format: :json }

    it 'creates a new permalink' do
      expect { subject }.to change{ Permalink.count }.by 1
    end

    it 'is successful' do
      expect(response).to be_success
    end
  end
end
