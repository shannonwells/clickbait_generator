class PermalinksController < ApplicationController

  def show
    @permalink = Permalink.find params[:id]
    render 'home/index'
  end

  def create
    @permalink = Permalink.create title_params
  end

  private

  def title_params
    params.require(:permalink).permit(:headline)
  end
end
