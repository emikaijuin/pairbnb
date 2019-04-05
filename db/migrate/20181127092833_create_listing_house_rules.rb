class CreateListingHouseRules < ActiveRecord::Migration[5.2]
  def change
    create_table :listing_house_rules do |t|
      t.belongs_to :listing
      t.belongs_to :house_rule
      t.text :detail
      t.timestamps
    end
  end
end
