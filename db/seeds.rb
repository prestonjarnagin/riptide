# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.production?
  seed = ActionController::Base.helpers.asset_path('surf_locations.json')
  json = JSON.parse(File.read(seed))
  json.each do |record|
    id = record.keys[0]
    location_name = record.values[0]['location']
    location_region = record.values[0]['region']
    Location.create!(id: id, location_name: location_name, location_region: location_region)
  end
else
  seed = './app/assets/documents/surf_locations.json'
  json = JSON.parse(File.read(seed))
  json.each do |record|
    id = record.keys[0]
    location_name = record.values[0]['location']
    location_region = record.values[0]['region']
    Location.create!(id: id, location_name: location_name, location_region: location_region)
  end
end
