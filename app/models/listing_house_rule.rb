class ListingHouseRule < ApplicationRecord
  belongs_to :listing
  belongs_to :house_rule
end
