class ListingsController < ApplicationController
  before_action :set_listing, except: [:index, :new, :create]

  def index
    if params[:search]
      @listings = Listing.where(city: params[:city])
    else
      @listings = Listing.featured
    end
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end
end
