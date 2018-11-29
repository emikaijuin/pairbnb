class CreateListingAmenities < ActiveRecord::Migration[5.2]
  def change
    create_table :listing_amenities do |t|
      t.belongs_to :listing 
      t.belongs_to :amenity
      t.integer :quantity
      t.text :detail
      t.timestamps
    end
  end
end
