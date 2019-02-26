class HomeController < ApplicationController

  def show
  def index
    @facade = SurfDataFacade.new(1)
  end

end
