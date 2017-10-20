require 'rails_helper'

describe ClickbaitsController, type: :controller do
  let(:headline) { "something hilarious" }

  describe 'create' do
    let(:expected_url) {"https://farm3.staticflickr.com/2912/12345_z.jpg"}

    subject { post :create, params: {
        clickbait: {
            headline: headline, headline_type: 'listicle', image_url: expected_url } ,
            format: :json }}

    it 'creates a new clickbait' do
      expect { subject }.to change{ Clickbait.count }.by 1
    end

    it 'has the headline we supplied' do
      subject
      expect(assigns[:clickbait].headline).to eql headline
    end

    it 'has the image url' do
      allow(Clickraw).to receive(:run) {
         {   url: expected_url,
            owner: "Just Some Guy (Flickr: @justsomeguy)",
            owner_url: "https://m.flickr.com/photostream.gne?id=999999"
        }}

      subject
      expect(Clickbait.last.image_url).to eql expected_url
    end

    it 'is successful' do
      subject
      expect(response).to be_success
    end
  end

end
