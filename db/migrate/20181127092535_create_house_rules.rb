class CreateHouseRules < ActiveRecord::Migration[5.2]
  def change
    create_table :house_rules do |t|
      t.string :description
      t.timestamps
    end
  end
end
