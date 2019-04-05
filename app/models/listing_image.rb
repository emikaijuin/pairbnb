class ListingImage < ApplicationRecord
  belongs_to :listing
  belongs_to :image
end
