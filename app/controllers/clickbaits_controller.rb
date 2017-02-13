class ClickbaitsController < ApplicationController

  def show
    @clickbait = Clickbait.find params[:id]
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
end
