# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

seed = './public/assets/surf_locations.json'
json = JSON.parse(File.read(seed))
json.each do |record|
  id = record.keys[0]
  name = record.values[0]['location']
  region = record.values[0]['region']
  begin
    p "Location #{id} Created!"
    Location.create(id: id, name: name, region: region)
  rescue
    p "Error Creating Location #{id}"
  end
end
