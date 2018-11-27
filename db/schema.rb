# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_11_27_092833) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amenities", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "house_rules", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listing_amenities", force: :cascade do |t|
    t.bigint "listing_id"
    t.bigint "amenity_id"
    t.integer "quantity"
    t.text "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["amenity_id"], name: "index_listing_amenities_on_amenity_id"
    t.index ["listing_id"], name: "index_listing_amenities_on_listing_id"
  end

  create_table "listing_house_rules", force: :cascade do |t|
    t.bigint "listing_id"
    t.bigint "house_rule_id"
    t.text "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_rule_id"], name: "index_listing_house_rules_on_house_rule_id"
    t.index ["listing_id"], name: "index_listing_house_rules_on_listing_id"
  end

  create_table "listings", force: :cascade do |t|
    t.text "title"
    t.text "description"
    t.text "property_type"
    t.text "property_subtype"
    t.integer "guests"
    t.integer "bedrooms"
    t.integer "beds"
    t.float "bathrooms"
    t.text "address"
    t.text "secondary_address"
    t.text "city"
    t.text "state"
    t.text "postal_code"
    t.text "country"
    t.bigint "user_id"
    t.text "details", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bathrooms"], name: "index_listings_on_bathrooms"
    t.index ["bedrooms"], name: "index_listings_on_bedrooms"
    t.index ["beds"], name: "index_listings_on_beds"
    t.index ["guests"], name: "index_listings_on_guests"
    t.index ["user_id"], name: "index_listings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
