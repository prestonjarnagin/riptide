class SurfDataFacade

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

  private

  def data
    service.get_json
  end

  def service
    SeaweedService.new
  end

end
