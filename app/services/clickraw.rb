class Clickraw
  FlickRaw.api_key = (ENV['FLICKR_API_KEY'] || "abcd1234")
  FlickRaw.shared_secret = (ENV['FLICKR_SECRET']  || "secret")


  DEFAULT_PARAMS= {
      privacy_filter: 1,
      safe_search: true,
      content_type: 1,
      # media: "photos",
      license: "5,7,9,10"
  }

  def initialize(taglist)
    @token = flickr.get_request_token
    @taglist = taglist
  end

  def self.run(*args)
    self.new(*args).run
  end

  def run
    search_results = flickr_search taglist
    if search_results.total == "0"
      photo = flickr_random_photo
    else
      photo = search_results[0]
    end
    { url: flickr_url(photo["id"]) }.merge(flickr_user(photo["owner"]))
  end

  def flickr_search(taglist)
    flickr.photos.search(DEFAULT_PARAMS.merge(text: taglist.join(" "), sort: "relevance", per_page: 1))
  end

  def flickr_url(photo_id)
    info = flickr.photos.getInfo(:photo_id => photo_id)
    FlickRaw.url_z(info)
  end

  def flickr_user(user_id)
    info = flickr.people.getInfo(user_id: user_id)
    {
        owner: "#{info["username"]} (Flickr: @#{info["path_alias"]})",
        owner_url: info["profileurl"]
    }
  end

  def flickr_random_photo
    index = SecureRandom.random_number(29)
    resp = flickr.photos.search(
        DEFAULT_PARAMS.merge(per_page: 30, sort: "interestingness-desc")
    )
    resp[index]
  end

  attr_accessor :taglist, :token
end
