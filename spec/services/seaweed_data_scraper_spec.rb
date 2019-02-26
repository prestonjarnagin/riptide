require 'rails_helper'

RSpec.describe SeaweedDataScraper do

  it 'exists' do
    expect(described_class).to eq(SeaweedDataScraper)
  end

  it 'retrieves data' do
    id = Location.first.id

    response = described_class.get_or_create_document(id)

    # expect($redis.get(loc.id)).to_not be_nil
  end

end
