require 'rails_helper'

RSpec.feature "Home Page", type: :feature do

  it 'shows name of application' do
    Location.create(id: 1, name: "Newquay - Fistral North", region: "UK + Ireland")

    visit '/'
    expect(page).to have_content('Riptide')
  end

  it 'shows some surf data' do
    Location.create(id: 1, name: "Newquay - Fistral North", region: "UK + Ireland")

    visit '/'
    expect(page).to have_content('Wind Speed')
  end
end
