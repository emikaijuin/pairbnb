class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    # Basic Info
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birthday, :date

    # Contact Info
    add_column :users, :phone_number, :string

    # Address
    add_column :users, :address, :string
    add_column :users, :secondary_address, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip_code, :string
    add_column :users, :country, :string

    # AirBnB Status
    add_column :users, :host, :integer, default: 0 # not a host, host, or superhost
    add_column :users, :status, :integer, default: 0 # customer, moderator, or superadmin
  end
end
