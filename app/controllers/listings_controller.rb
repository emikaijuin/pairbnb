class ListingsController < ApplicationController
  before_action :set_listing, except: [:index, :new, :create, :property_types]

  def index
    @listings = Listing.order(:title).page(params[:page]).per(24)
    @listings = @listings.where(city: params[:city]) if params[:search]
    @listings = @listings.filter_by_amenities(params[:amenities].keys) if params[:amenities]
    @listings = @listings.filter_by_guests(params[:guests]) if params[:guests]
    # @listings = @listings.filter_by_dates(params[:dates]) if params[:dates] # add bookings before implementing

    respond_to do |format|
      format.html {
        @amenities = Amenity.all
      }
      format.js { render :filter }
    end
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing, @errors = NewListingService.new(listing_params, current_user).run
    if @listing.id
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  # AJAX REQUESTS

  def property_types
    @property_subtypes = Listing.property_types[params[:property_type]]
    respond_to do |format|
      format.js { render :json => @property_subtypes }
    end
  end

  private

  def set_listing
    @listing = Listing.includes(:amenities).find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(
      :title,
      :description,
      :property_type,
      :property_subtype,
      :guests,
      :bedrooms,
      :beds,
      :bathrooms,
      :address,
      :secondary_address,
      :city,
      :state,
      :postal_code,
      :country,
      :details,
      amenities: [
        "14", # essentials
        "15", # wifi
        "16", # shampoo
        "17", # closet_or_drawesr
        "18", # tv
        "19", # heat
        "20", # air_conditioning
        "21", # breakfast_coffee_tea
        "22", # desk_or_workspace
        "23", # fireplace
        "24", # iron
        "25", # hair_dryer
        "26",  # private_entrance
      ],
      house_rules: [
        "1", # suitable for children
        "2", # suitable for infants
        "3", # suitable for pets
        "4", # smoking allowed
        "5", # events or parties allowed
      ],
      images: [],
    )
  end
end
