class CreateAmenities < ActiveRecord::Migration[5.2]
  def change
    create_table :amenities do |t|
      t.string :description
      t.integer :category
      t.timestamps
    end
  end
end
