class ListingsController < ApplicationController
  before_action :set_listing, except: [:index, :new, :create, :property_types]

  def index
    if params[:search]
      @listings = Listing.where(city: params[:city])
    else
      @listings = Listing.order(:title).page(params[:page]).per(24)
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
			format.js {render :json => @property_subtypes }
    end
  end

  def filter
		@listings = params.include?("listing") ? (Listing.where(listing_params).order(:name).page params[:page]) : (Listing.all.order(:name).page params[:page])
		
		respond_to do |format|
			format.js
		end
	end


  private

  def set_listing
    @listing = Listing.find(params[:id])
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
      "26"  # private_entrance
     ],
     house_rules: [
       "1", # suitable for children
       "2", # suitable for infants
       "3", # suitable for pets
       "4", # smoking allowed
       "5" # events or parties allowed
     ],
     images: []
     )
  end
end
