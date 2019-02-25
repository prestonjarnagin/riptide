require 'rails_helper'

RSpec.describe SeaweedDataScraper do
  it 'exists' do
    SeaweedDataScraper.new()
    expect(described_class).to eq(SeaweedDataScraper)
  end

end
