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

ActiveRecord::Schema.define(version: 20180417091340) do

  create_table "items", force: :cascade do |t|
    t.integer "class_id"
    t.integer "instance_id"
    t.string "hash_name"
    t.float "price"
    t.string "link"
    t.string "status"
    t.string "ui_id"
    t.string "i_market_hash_name"
    t.string "i_market_name"
    t.string "i_name"
    t.string "i_name_color"
    t.string "i_rarity"
    t.integer "ui_status"
    t.string "he_name"
    t.float "ui_price"
    t.integer "min_price"
    t.string "ui_price_text"
    t.boolean "min_price_text"
    t.string "i_classid"
    t.string "i_instanceid"
    t.boolean "ui_new"
    t.integer "position"
    t.string "wear"
    t.integer "tradable"
    t.float "i_market_price"
    t.string "i_market_price_text"
    t.string "ui_real_instance"
    t.string "ui_bid"
    t.string "ui_asset"
    t.string "type_new"
    t.integer "offer_live_time"
    t.string "placed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "class_id"
    t.integer "instance_id"
    t.string "hash_name"
    t.float "price"
    t.string "link"
    t.string "status"
    t.string "ui_id"
    t.string "i_market_hash_name"
    t.string "i_market_name"
    t.string "i_name"
    t.string "i_name_color"
    t.string "i_rarity"
    t.integer "ui_status"
    t.string "he_name"
    t.float "ui_price"
    t.integer "min_price"
    t.string "ui_price_text"
    t.boolean "min_price_text"
    t.string "i_classid"
    t.string "i_instanceid"
    t.boolean "ui_new"
    t.integer "position"
    t.string "wear"
    t.integer "tradable"
    t.float "i_market_price"
    t.string "i_market_price_text"
    t.string "ui_real_instance"
    t.string "ui_bid"
    t.string "ui_asset"
    t.string "type_new"
    t.integer "offer_live_time"
    t.string "placed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
