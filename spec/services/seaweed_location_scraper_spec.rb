require 'rails_helper'

RSpec.describe SeaweedLocationScraper do

  it 'exists' do
    subject = SeaweedLocationScraper.new

    expect(described_class).to eq(SeaweedLocationScraper)
  end

end
