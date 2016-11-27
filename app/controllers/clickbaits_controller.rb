class ClickbaitsController < ApplicationController

  def show
    @clickbait = Clickbait.find params[:id]
    render 'home/index'
  end

  def create
    @clickbait = Clickbait.create title_params
    if @clickbait.valid?
      render json: { result: 'success', url: clickbaits_url(@clickbait)}, status: :ok
    else
      render json: { result: 'error', url: ''}, status: :internal_server_error
    end
  end

  private

  def title_params
    params.require(:clickbait).permit(:headline, :headline_type)
  end
end
