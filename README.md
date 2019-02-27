# Riptide

Riptide is an application to provide some simple data on surf spots around the world.  

Data about current conditions and the list of locations is web-scraped from [MagicSeaweed](https://magicseaweed.com/).

A live version of this app can be found at https://riptide-0.herokuapp.com/

Static text in the application is locallized to English, Spanish, and Piglatin. Add `?locale=` and either `en`, `es`, or `piglatin` to access the localized versions

#### Setup
- Clone down this repo
- Run `$ rake db:{create,migrate,seed}`
  - This creates a list of locations that are read in from a JSON file in `./public/assets`.
  - This JSON was generated through the `./app/services/seaweed_location_scraper` file (currently commented out to improve test coverage. Testing such functionality would take the better part of an hour and wouldn't need to be repeated in a production environment very often).
- Start a local server with `$ rails s` and navigate to `localhost:3000` on your browser of choice.
- Tests can be run with `$ rspec`

#### Future Features
- Implement Redis to store information to cut down on duplicate requests and speed up load times
- Use VCR for testing


#### Built With
- Ruby (2.3.7)
- Rails (5.1.6.1)
- MagicSeaweed
- JavaScript
- Fast-JsonAPI
- Faraday
- Pry
- RSpec, SimpleCov, Shoulda-Matchers
- ❤️
