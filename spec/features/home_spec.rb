require 'rails_helper'

RSpec.feature "Home Page", type: :feature do

  it 'shows name of application' do
    visit '/'
    expect(page).to have_content('Riptide')
  end
end
