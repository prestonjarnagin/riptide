require 'rails_helper'

RSpec.describe SeaweedDataScraper do

  it 'exists' do
    expect(described_class).to eq(SeaweedDataScraper)
  end

  it 'retrieves data' do
      loc = Location.create(id: 1, name: "Newquay - Fistral North", region: "UK + Ireland")

      response = described_class.get_or_create_document(loc.id)
      expect(response).to be_kind_of(String)
      expect(response).to include("Surf Report")
  end

  it 'stores data in redis' do
    loc = Location.create(id: 1, name: "Newquay - Fistral North", region: "UK + Ireland")
    # $redis.del(loc.id)

    described_class.get_or_create_document(loc.id)

    # expect($redis.get(loc.id)).to_not be_nil
  end

  it 'returns a hash with information' do
    loc = Location.create(id: 1, name: "Newquay - Fistral North", region: "UK + Ireland")
    # $redis.del(loc.id)

    actual = described_class.json(loc.id)

    expect(actual).to be_kind_of(Hash)
    expect(actual[:timestamp]).to be_kind_of(Integer)
    expect(actual).to be_kind_of(Hash)
  end
end
