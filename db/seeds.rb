require 'faker'
ActiveRecord::Base.transaction do
  # ## Run below code only once after creating a database. It will create the list of amenities offered to list on AirBnB properties.
  #   basic_amenities = %w(essentials wifi shampoo closet_or_drawers tv heat air_conditioning breakfast_coffee_tea desk_or_workspace fireplace iron hair_dryer private_entrance )
  #   safety_amenities = %w(smoke_detector carbon_monoxide_detector first_aid_kit fire_extinguisher lock_on_bedroom_door)
  #   house_rules = %w(suitable_for_children suitable_for_infants suitable_for_pets smoking_allowed events_or_partied_allowed)
  #   basic_amenities.each do |description|
  #     amenity = Amenity.new
  #     amenity.description = description
  #     amenity.category = 0
  #     amenity.save
  #   end
  #   safety_amenities.each do |description|
  #     amenity = Amenity.new
  #     amenity.description = description
  #     amenity.category = 1
  #   end
  #   house_rules.each do |description|
  #     rule = HouseRule.new
  #     rule.description = description
  #     rule.save
  #   end

  # 50.times do
  #   user = User.new
  #   user.email = Faker::Internet.email
  #   user.password = "password"
  #   user.save
  # end

  property_types = %w(apartment house Secondary\ Unit Unique\ Space Bed\ and\ Breakfast Boutique\ Hotel)
  property_subtypes = {
    apartment: %w(apartment condominium Casa\ particular loft Serviced\ apartment),
    house: %w(house bungalow cabin Casa\ particular chalet cottage Cycladic\ house\ (Greece) dammuso Dome\ house Earth\ house Farm\ stay houseboat hut lighthouse Pension\ (South\ Korea) Shepherd's\ hut\ (U.K., France) Tiny\ house townhouse trullo villa),
    "Secondary Unit": %w(Guesthouse Guest\ suite Farm\ stay),
    "Unique Space": %w(barn boat bus Camper\RV campsite castle cave dome\ house earth\ house farm\ stay houseboat hut igloo island lighthouse pension\ (South Korea) plane shepherd's\ hut\ (U.K., France) tent tiny\ house tipi train treehouse windmill yurt),
    "Bed and Breakfast": %w(bed\ and\ breakfast casa\ particular farm\ stay minsu\ (taiwan) nature\ lodge ryokan\ (japan)),
    "Boutique Hotel": %w(boutique\ hotel aparthotel heritage\ hotel\ (india) hostel hotel nature\ lodge resort serviced\ apartment)
  }
  50.times do
    listing = Listing.new
    # Basic Information
    listing.title = Faker::Lorem.words(rand(3..6)).join(" ")
    listing.description = Faker::Lorem.sentence(rand(3..7))
    # Property Types
    property_type = property_types[rand(property_types.length)]
    property_subtype_options = property_subtypes[property_type.to_sym]
    property_subtype = property_subtype_options[rand(property_subtype_options.length)]
    listing.property_type = property_type
    listing.property_subtype = property_subtype
    # Location
    listing.address = Faker::Address.street_address
    listing.secondary_address = [nil, Faker::Address.secondary_address][rand(2)]
    listing.city = Faker::Address.city
    listing.state = Faker::Address.state_abbr
    listing.postal_code = Faker::Address.zip
    listing.country = Faker::Address.country
    # User
    listing.user_id = User.order("RANDOM()").first.id

    listing.save
  end
end
