class HomeController < ApplicationController

  def show
    @facade = SurfDataFacade.new
  end

end
