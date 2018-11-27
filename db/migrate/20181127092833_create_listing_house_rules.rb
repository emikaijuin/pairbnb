class CreateListingHouseRules < ActiveRecord::Migration[5.2]
  def change
    create_table :listing_house_rules do |t|
      t.text :description
      t.timestamps
    end
  end
end
