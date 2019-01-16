class Image < ApplicationRecord
  mount_uploader :upload, ImageUploader

  def self.add_to_listing(listing, images)
    images.each do |image|
      listing.images << Image.create(upload: image)
    end
  end
end
