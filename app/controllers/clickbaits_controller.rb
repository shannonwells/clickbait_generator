class ClickbaitsController < ApplicationController

  def index
    munged_params = clickbait_params
    @clickbaits = Clickbait.order(munged_params[:sort][:sort_type])
  end

  def create
    @clickbait = Clickbait.create title_params
    flash[:alert] = "There was a problem saving this Clickbait, sorryyyy!" if !@clickbait.valid?
    render layout: false
  end

  private

  def title_params
    params.require(:clickbait).permit(:headline, :headline_type)
  end

  def clickbait_params
    new_params = params.require(:clickbait).permit(:page, :per_page, sort: { :sort_type, :sort_order } )[:clickbait]
  end
end
