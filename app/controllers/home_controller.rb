class HomeController < ApplicationController

  def show
    # Returns a new facade with information for
    # the requested location
    payload = SurfDataFacade.new(params[:id])
    render json: SurfDataSerializer.new(payload)
  end

  def index
    @facade = SurfDataFacade.new(1)
  end

end
