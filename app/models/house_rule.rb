class HouseRule < ApplicationRecord
  has_many :listing_house_rules
  has_many :listing, through: :listing_house_rules
end
