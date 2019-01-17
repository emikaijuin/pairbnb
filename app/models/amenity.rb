class Amenity < ApplicationRecord
  enum category: [:basic, :safety]
  has_many :listing_amenities
  has_many :listings, through: :listing_amenities

  mount_uploader :icon, IconUploader
end
