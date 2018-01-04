class ClickbaitPresenter

  def initialize(clickbait)
    @clickbait = clickbait
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
        image: {url: @image_url, title: @owner_title},
    }}.to_json
  end

end