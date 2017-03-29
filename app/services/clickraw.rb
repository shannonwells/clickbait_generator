class Clickraw
  FlickRaw.api_key = (ENV.fetch ('FLICKR_API_KEY') || "abcd1234")
  FlickRaw.shared_secret = (ENV.fetch('FLICKR_SECRET')  || "secret")

  # https://api.flickr.com/services
  # Possible licenses & ids:
  # <license id="0" name="All Rights Reserved" url="" />
  # <license id="4" name="Attribution License" url="https://creativecommons.org/licenses/by/2.0/" />
  # <license id="6" name="Attribution-NoDerivs License" url="https://creativecommons.org/licenses/by-nd/2.0/" />
  # <license id="3" name="Attribution-NonCommercial-NoDerivs License" url="https://creativecommons.org/licenses/by-nc-nd/2.0/" />
  # <license id="2" name="Attribution-NonCommercial License" url="https://creativecommons.org/licenses/by-nc/2.0/" />
  # <license id="1" name="Attribution-NonCommercial-ShareAlike License" url="https://creativecommons.org/licenses/by-nc-sa/2.0/" />
  # <license id="5" name="Attribution-ShareAlike License" url="https://creativecommons.org/licenses/by-sa/2.0/" />
  # <license id="7" name="No known copyright restrictions" url="https://www.flickr.com/commons/usage/" />
  # <license id="8" name="United States Government Work" url="http://www.usa.gov/copyright.shtml" />
  # <license id="9" name="Public Domain Dedication (CC0)" url="https://creativecommons.org/publicdomain/zero/1.0/" />
  # <license id="10" name="Public Domain Mark" url="https://creativecommons.org/publicdomain/mark/1.0/" />

  # https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=e3a3e31b9a4a1f7e0db05bee88fec7a4&text=kitten+water&license=5%2C7%2C9%2C10&sort=interestingness-desc&safe_search=true&format=json&nojsoncallback=1&auth_token=72157680226347440-3ef50a4f6aaa1d99&api_sig=9ed0a9a131c0b2ff4adc71f03a6c16ae
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
        owner: "#{info["username"]} Flickr:@(#{info["path_alias"]})",
        owner_url: info["profileurl"]
    }
  end

end
