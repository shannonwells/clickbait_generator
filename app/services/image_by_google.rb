
class ImageByGoogle

  BASE_URL="https://www.googleapis.com"
  PATH="/customsearch/v1"

  def self.run(*args)
    self.new(*args).run
  end

  def initialize(taglist)
    @query = taglist.join(" ")
  end

  def run
    parsed = JSON.parse(do_search.body)
    if parsed["searchInformation"]["totalResults"] == "0"
      query = query.split(" ")[0]
      parsed = JSON.parse(do_search.body)
    end
    { url: parsed["items"][0]["link"], title: parsed["items"][0]["title"] }
  end

  attr_accessor :results, :query

  private

  def do_search
    conn = Faraday.new(:url => BASE_URL) do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    conn.get PATH, query_params
  end

  def query_params
    {
        q: query,
        cx: ENV['GOOGLE_SEARCH_ENGINE_ID'] || "abcd123",
        safe: 'high',
        searchType: 'image',
        imgType: "photo",
        key: ENV['GOOGLE_API_KEY'] || "abcd123",
        imgSize: 'medium',
        num: 1,
        rights: "cc_publicdomain,cc_noncommercial"
    }
  end

end