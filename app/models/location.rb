class Location < ApplicationRecord
    validates :name, uniqueness: true, presence: true
    validates :region, presence: true
end
