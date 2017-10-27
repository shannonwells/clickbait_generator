require 'rails_helper'

describe ImageByGoogle do
  include GoogleResponseHelpers

  let(:taglist) { %w(happy baby) }

  before do
    mock_json_response("happy baby")
  end

  subject(:image_search) { ImageByGoogle.new(taglist).run }

  it 'works' do
    expect(subject[:url]).to eql "https://c1.staticflickr.com/8/7277/7422777704_621a7d7b2c_n.jpg"
    expect(subject[:title]).to eql "Happy Baby | Jason Evans | Flickr"
  end
end