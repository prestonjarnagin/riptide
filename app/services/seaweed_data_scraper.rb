class SeaweedDataScraper
  # Seaweed data scraper pulls relevant information for a given location id.

  # The class assumes the database is already populated with accurate location
  # id's and location names

  def self.json(id)
    body = self.get_or_create_document(id)
    nk = Nokogiri::HTML(body)
    JSON.parse(nk.css('div.msw-js-current-conditions')[0].values[1], symbolize_names: true)
  end

  def self.get_or_create_document(id)
    # if $redis.get(id)
    #   return $redis.get(id)
    # else
      document = conn(id).body
      # $redis.set(id, document)
      return document
    # end
  end

  private

  def self.conn(id)
    root = "https://magicseaweed.com"
    location_name = Location.find(id).name.titleize.gsub(' - ', ' ')
    location_name = location_name.gsub(' ', '-')
    url = "#{root}/#{location_name}-Surf-Report/#{id}/"
    Faraday.get(url)
  end
end
