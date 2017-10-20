class ClickbaitsController < ApplicationController

  def create
    @clickbait = Clickbait.find_or_create_by title_params
    flash[:alert] = "There was a problem saving this Clickbait, sorry! I can grovel now. Do you want me to grovel?" if !@clickbait.valid?
    render layout: false
  end

  private

  def title_params
    params.require(:clickbait).permit(:headline, :headline_type, :image_url)
  end
end
                                                                     6