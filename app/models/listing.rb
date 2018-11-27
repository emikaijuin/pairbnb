class Listing < ApplicationRecord
  belongs_to :user
  
  has_many :listing_amenities
  has_many :amenities, through: :listing_amenities

  has_many :listing_house_rules
  has_many :house_rules, through: :listing_house_rules
end
