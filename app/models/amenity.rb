class Amenity < ApplicationRecord
  enum category: [:basic, :safety]
end
