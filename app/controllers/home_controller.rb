class HomeController < ApplicationController

  before_action :generate_clickbait, only: [:index, :generate]

  def index
    respond_to do |format|
      format.html { }
      format.json {
        render json: ClickbaitSerializer.new(@clickbait)
      }
    end
  end

  def generate
  end

  private

  def generate_clickbait
    @clickbait = ClickbaitBuilder.generate(params[:headline_type])
    @current_val = @clickbait.type
    @headline = @clickbait.headline
  end

end
