ActiveRecord::Base.transaction do
  basic_amenities = %w(essentials wifi shampoo closet_or_drawers tv heat air_conditioning breakfast_coffee_tea desk_or_workspace fireplace iron hair_dryer private_entrance )
  safety_amenities = %w(smoke_detector carbon_monoxide_detector first_aid_kit fire_extinguisher lock_on_bedroom_door)
  house_rules = %w(suitable_for_children suitable_for_infants suitable_for_pets smoking_allowed events_or_partied_allowed)

  basic_amenities.each do |description|
    amenity = Amenity.new
    amenity.description = description
    amenity.category = 0
    amenity.save
  end

  safety_amenities.each do |description|
    amenity = Amenity.new
    amenity.description = description
    amenity.category = 1
  end



end