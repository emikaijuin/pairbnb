class Listing < ApplicationRecord
  belongs_to :user

  has_many :listing_amenities
  has_many :amenities, through: :listing_amenities

  has_many :listing_house_rules
  has_many :house_rules, through: :listing_house_rules

  has_many :listing_images
  has_many :images, through: :listing_images

  scope :filter_by_amenities, ->(amenities) {
    includes(:listing_amenities)
      .where(listing_amenities: {
               :amenity_id => (
                 Amenity.where(:description => ["essentials", "hair_dryer"])
               )
             })
  }

  def self.featured
    Listing.all # this will change to trending listings based on reviews once review feature is implemented
  end

  def features
    # Analyzes listing and returns things to be featured (e.g. superhost, only airbnb in area to have drying machine, etc.)
    # Currently limiting to few potential features, future version may expand to include more
    features = Hash.new
    features[:superhost] = true if self.user.superhost?

    # features[:high_rating] = true
  end

  def self.property_types
    {
      "Apartment" => ["Apartment", "Condo", "Casa Particular (Cuba)", "Loft", "Serviced Apartment"],
      "Secondary Unit" => ["Guest House", "Guest Suite", "Homestay"],
      "House" => ["House", "Bungalow", "Casa particular (Cuba)", "Chalet", "Cottage", "Cycladic House (Greece)", "Dammuso (Italy)", "Dome house", "Earth house", "Farm stay", "Houseboat", "Hut", "Lighthouse", "Pension (South Korea)", "Shepherd's hut (U.K., France)", "Tiny house", "Townhouse", "Trullo (Italy)", "Villa"],
      "Unique Space" => ["Barn", "Boat", "Bus", "Camper/RV", "Campsite", "Castle", "Cave", "Dome house", "Earth house", "Farm stay", "Houseboat", "Hut", "Igloo", "Island", "Lighthouse", "Pension (South Korea)", "Plane", "Shepherd's hut (U.K., France)", "Tent", "Tiny house", "Windmill", "Yurt"],
      "Bed and Breakfast" => ["Bed and Breakfast", "Casa particular (Cuba)", "Farm stay", "Minsu (Taiwan)", "Nature lodge", "Ryokan (Japan)"],
      "Boutique Hotel" => ["Boutique Hotel", "Aparthotel", "Heritage hotel (India)", "Hostel", "Hotel", "Nature Lodge", "Resort", "Serviced apartment"]
    }
  end
end
