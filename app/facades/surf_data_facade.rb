class SurfDataFacade
  attr_reader :id

  def initialize(id)
    @id = id
    @_data
  end

  def location_name
    Location.find(@id).name
  end

  def region_name
    Location.find(@id).region
  end

  def timestamp
    data[:timestamp]
  end

  def wind
    data[:wind]
  end

  def conditions
    data[:condition]
  end

  def charts
    data[:charts]
  end

  def swell
    data[:swell]
  end

  def locations
    Location.all.order(:region)
  end

  private

  def data
    @_data ||= service.json(@id)
  end

  def service
    SeaweedDataScraper
  end

end
