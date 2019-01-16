class CreateListingImages < ActiveRecord::Migration[5.2]
  def change
    create_table :listing_images do |t|
      t.belongs_to :listing 
      t.belongs_to :image
      t.timestamps
    end
  end
end
