class ClickbaitPresenter

  def initialize(clickbait)
    @clickbait = clickbait
    set_image_info
  end

  def headline
    @clickbait.headline
  end

  def headline_type
    @clickbait.headline_type
  end

  def to_json(_unused)
    { clickbait: {
        headline: @clickbait.headline,
        type: @clickbait.headline_type,
        image: {url: @image_url},
        owner: {url: @owner_url, title: @owner_title}
    }}.to_json
  end

  private

  def set_image_info
    clickraw = Clickraw.new
    result = clickraw.flickr_search(@clickbait.tags)
    @owner_title = result[:owner]
    @owner_url = result[:owner_url]
    @image_url = result[:url]
  end
end