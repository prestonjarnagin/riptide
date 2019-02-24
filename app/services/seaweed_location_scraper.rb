class SeaweedLocationScraper

  def initialize
    
  end

  def process_into_json
    data = []
    (1..4880).each do |index|
      data << save(index)
    p index
    end
    File.open("./app/assets/documents/surf_locations.json","w") do |f|
      f.write(data.to_json)
    end
  end

  def read_from_json
    json = JSON.parse(File.read("./app/assets/documents/surf_locations.json"))
    json.each do |item|
      id = item.keys[0]
      name = item.values[0]['location']
      region = item.values[0]['region']
      Location.create!(id: id, name: name, region: region)
      p item
    end
  end

  def save(id)
    document = page(id)
    location = {
      id => {
        location: parse_surf_location(document),
        region: parse_region(document)
      }
    }
  end

  def parse_surf_location(document)
    begin
      document.css('h1').text.strip.gsub(" Spot Guide","")
    rescue
      ""
    end
  end

  def parse_region(document)
    begin
      document.css("span[itemprop=title]").children[0].text
    rescue
      ""
    end
  end

  def page(id)
    html_doc = Nokogiri::HTML(conn(id).body)
  end

  def conn(id)
    Faraday.get "https://magicseaweed.com/Surf-Beach-Surf-Guide/#{id}/"
  end

end
