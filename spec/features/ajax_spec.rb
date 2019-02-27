require 'rails_helper'

RSpec.describe 'Ajax Request', :type => :request do

  it 'returns expected information' do
    Location.create(id: 1, name: "Newquay - Fistral North", region: "UK + Ireland")

    get '/update?id=1'

    data = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(data[:attributes]).to have_key(:location_name)
    expect(data[:attributes]).to have_key(:region_name)
    expect(data[:attributes]).to have_key(:timestamp)
    expect(data[:attributes]).to have_key(:wind)
    expect(data[:attributes]).to have_key(:conditions)
    expect(data[:attributes]).to have_key(:swell)
  end

end
