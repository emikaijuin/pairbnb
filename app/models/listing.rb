class Listing < ApplicationRecord
  belongs_to :user
  
  has_many :listing_amenities
  has_many :amenities, through: :listing_amenities

  has_many :listing_house_rules
  has_many :house_rules, through: :listing_house_rules

  def self.featured
    Listing.all # this will change to trending listings based on reviews once review feature is implemented
  end
end
