class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      # Information
      t.text :title
      t.text :description
      # Capacity
      t.integer :guests, index: true, order: {guests: :asc}
      t.integer :bedrooms, index: true, order: {bedrooms: :asc}
      t.integer :beds, index: true, order: {beds: :asc}
      t.float :bathrooms, index: true, order: {bathrooms: :asc}
      # Location
      t.text :address
      t.text :secondary_address
      t.text :city
      t.text :state
      t.text :postal_code
      t.text :country
      # Owner
      t.belongs_to :user, index: true

      t.timestamps, null: false
    end

  end
end
