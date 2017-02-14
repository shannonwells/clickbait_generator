module BestOfHelper
  def best_of_url(clickbait)
    root_url(anchor: clickbait.to_param)
  end
end
