class Clickraw
  FlickRaw.api_key = (ENV['FLICKR_API_KEY'] || "abcd1234")
  FlickRaw.shared_secret = (ENV['FLICKR_SECRET']  || "secret")

  def initialize
    @token = flickr.get_request_token
  end

  def flickr_search(taglist)
    resp = flickr.photos.search(
        text: taglist.join(" "),
        sort: "interestingness-desc",
        privacy_filter: 1,
        safe_search: true,
        license: "5,7,9,10"
    ).first
    flickr_user(resp["owner"]).merge(url: flickr_url(resp["id"]))
  end

  def flickr_url(photo_id)
    info = flickr.photos.getInfo(:photo_id => photo_id)
    FlickRaw.url_b(info)
  end

  def flickr_user(user_id)
    info = flickr.people.getInfo(user_id: user_id)
    {
        owner: "#{info["username"]} (Flickr: @#{info["path_alias"]})",
        owner_url: info["profileurl"]
    }
  end

end
