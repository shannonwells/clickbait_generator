class HomeController < ApplicationController

  def index
  end

  def generate
    fetch_or_generate_clickbait(clickbait_params[:id])
    respond_to do |format|
      format.js {}
      format.json {
        render json: @clickbait
      }
    end
  end

  def slackbot_generate
    fetch_or_generate_clickbait(nil)
    render plain: @clickbait.headline, status: 200
  end

  private

  def clickbait_params
    # params[:headline_type] ||= params[:text]
    # params.permit(:id, :headline_type)
    params
  end

  def fetch_or_generate_clickbait(best_of_id)
    @clickbait = fetch_clickbait(best_of_id) || generate_clickbait
    @headline = @clickbait.headline
  end

  def fetch_clickbait(best_of_id)
    Clickbait.find_by(id: best_of_id) if best_of_id
  end

  def generate_clickbait
    ClickbaitBuilder.generate(clickbait_params[:headline_type])
  end

end
