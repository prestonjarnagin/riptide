require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'Valiadtions' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:region) }
  end
end
