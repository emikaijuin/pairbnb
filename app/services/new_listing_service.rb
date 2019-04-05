class NewListingService
  def initialize(params, user)
    @house_rule_ids = params.delete(:house_rules)
    @amenity_ids = params.delete(:amenities)
    @image_files = params.delete(:images)
    @listing = user.listings.new(params) # leftover params are only for listing object
    @errors = []
  end

  def run
    if @listing.save
      associate_amenities_and_house_rules
      upload_images
    else
      @errors = @listing.errors
    end

    return [@listing, @errors]
  end

  private

  def associate_amenities_and_house_rules
    associate_amenities
    associate_house_rules
  end

  def associate_amenities
    begin
      @amenity_ids.each do |k, v|
        @listing.amenities << Amenity.find(k) if v == "1"
      end
    rescue
      @errors << "There was an issue setting your listing amenities."
    end
  end

  def associate_house_rules
    begin
      @house_rule_ids.each do |k, v|
        @listing.house_rules << HouseRule.find(k) if v == "1"
      end
    rescue
      @errors << "There was an issue setting your listing house rules."
    end
  end

  def upload_images
    begin
      @image_files.each do |image_upload|
        @listing.images << Image.create(upload: image_upload)
      end
    rescue
      @errors << "There was an issue uploading your photos."
    end
  end
end
