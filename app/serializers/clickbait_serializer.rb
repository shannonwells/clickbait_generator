class ClickbaitSerializer

  def initialize(clickbait)
    @model = clickbait
  end

  def to_json(_ = nil)
    [:headline, :type].inject({}) do |memo, method|
      memo[method] = @model.send(method)
      memo
    end
  end

end
