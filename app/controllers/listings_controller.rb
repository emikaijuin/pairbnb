class ListingsController < ApplicationController
  before_action :set_listing, except: [:index, :new, :create, :property_types]

  def index
    if params[:search]
      @listings = Listing.where(city: params[:city])
    else
      @listings = Listing.all
    end
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save
      Image.add_to_listing(@listing, params[:listing][:images]) # this shouldn't be in controller- how to refactor out of controller? Add to a service layer?
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

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(
     :images,
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
     :details
     )
  end
end
