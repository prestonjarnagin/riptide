require 'rails_helper'

RSpec.describe SeaweedDataScraper do

  it 'exists' do
    expect(described_class).to eq(SeaweedDataScraper)
  end

  it 'retrieves data' do
    id = Location.first.id

    response = described_class.get_or_create_document(id)

    expect(response).to be_kind_of(String)
    expect(response).to include("Surf Report")
  end

end
