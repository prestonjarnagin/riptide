class SeaweedService

  def initialize
    @_cache
  end

  def get_json
    r ||= @_cache = JSON.parse(File.read('./spec/fixtures/magic_seaweed_response.json'), symbolize_names: true)
    r[0]
  end
  private

  def conn

  end

end
