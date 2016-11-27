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

  def slackbot_generate
    params[:headline_type] = params[:text]
    generate_clickbait
    render plain: @clickbait.headline, status: 200
  end

  private

  def generate_clickbait
    @clickbait = ClickbaitBuilder.generate(params[:headline_type])
    @current_val = @clickbait.headline_type
    @headline = @clickbait.headline
  end

end
