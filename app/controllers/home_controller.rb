class HomeController < ApplicationController

  before_action :generate_clickbait, only: [:index, :generate]

  def index
  end

  def generate
    respond_to do |format|
      format.js {}
      format.json {
        render json: @clickbait
      }
    end
  end

  private

  def generate_clickbait
    @clickbait = ClickbaitBuilder.generate(params[:headline_type])
    @current_val = @clickbait.type
    @headline = @clickbait.headline
  end

end
