module GoogleResponseHelpers

  FIXTURE_PATH = "#{Rails.root}/spec/fixtures"

  def mock_json_response(query)
    resp = load_fixture "google_has_result.json"
    stub_with_resp resp.delete("\n"), query
  end

  def mock_empty_json_response
    resp = load_fixture "google_no_result.json"
    stub_with_resp resp.delete("\n"), query
  end

  def mock_image_by_google_result(title)
    allow(ImageByGoogle).to receive(:run).and_return(
        { title: title, url: "https://c1.staticflickr.com/8/7277/7422777704_621a7d7b2c_n.jpg"}
    )
  end

  def load_fixture(filename)
    file = File.new "#{FIXTURE_PATH}/#{filename}"
    file.read
  end

  def stub_with_resp(resp, query)
    encoded_q = query_params(query).to_param
    stub_request(:get, "#{ImageByGoogle::BASE_URL}#{ImageByGoogle::PATH}?#{encoded_q}").
        to_return(status: 200, body: resp)
  end

  def query_params(query)
    {
        q: query,
        cx: ENV['GOOGLE_SEARCH_ENGINE_ID'] || "abcd123",
        safe: 'medium',
        searchType: 'image',
        key: ENV['GOOGLE_API_KEY'] || "abcd123",
        imgSize: 'medium',
        num: 1,
        rights: "cc_publicdomain,cc_noncommercial"
    }
  end

end