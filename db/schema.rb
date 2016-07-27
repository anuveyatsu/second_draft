# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160727070141) do

  create_table "buyer_legal_details", force: :cascade do |t|
    t.string   "b_legal_name"
    t.string   "b_legal_BIN"
    t.string   "b_legal_address"
    t.string   "b_legal_bank_name"
    t.string   "b_legal_bank_BIN"
    t.string   "b_legal_SWIFT"
    t.string   "b_legal_bank_account"
    t.string   "b_legal_CEO"
    t.integer  "buyer_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "buyer_legal_details", ["buyer_id"], name: "index_buyer_legal_details_on_buyer_id"

  create_table "buyers", force: :cascade do |t|
    t.string   "buyer_name"
    t.string   "buyer_phone"
    t.string   "buyer_email"
    t.integer  "seller_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "buyers", ["seller_id"], name: "index_buyers_on_seller_id"

  create_table "courier_legal_detail", force: :cascade do |t|
    t.string   "c_legal_name"
    t.string   "c_legal_BIN"
    t.string   "c_legal_address"
    t.string   "c_legal_bank_name"
    t.string   "c_legal_bank_BIN"
    t.string   "c_legal_SWIFT"
    t.string   "c_legal_bank_account"
    t.string   "c_legal_CEO"
    t.integer  "courier_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "courier_legal_detail", ["courier_id"], name: "index_courier_legal_detail_on_courier_id"

  create_table "couriers", force: :cascade do |t|
    t.string   "courier_name"
    t.string   "courier_phone"
    t.string   "courier_email"
    t.string   "courier_vehicle_number"
    t.string   "courier_vehicle_model"
    t.string   "courier_vehicle_color"
    t.string   "courier_vehicle_capacity"
    t.string   "courier_vehicle_bearing"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "from"
    t.string   "buyer_name"
    t.string   "buyer_phone"
    t.string   "buyer_email"
    t.string   "delivery_option"
    t.string   "transport_provider"
    t.string   "delivery_status"
    t.string   "parcel_size_L"
    t.string   "parcel_size_W"
    t.string   "parcel_size_H"
    t.string   "parcel_weight"
    t.string   "parcel_content"
    t.integer  "seller_id"
    t.integer  "store_id"
    t.integer  "warehouse_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "pincode"
  end

  add_index "orders", ["seller_id"], name: "index_orders_on_seller_id"
  add_index "orders", ["store_id"], name: "index_orders_on_store_id"
  add_index "orders", ["warehouse_id"], name: "index_orders_on_warehouse_id"

  create_table "pickups", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
  end

  add_index "pickups", ["email"], name: "index_pickups_on_email", unique: true
  add_index "pickups", ["reset_password_token"], name: "index_pickups_on_reset_password_token", unique: true

  create_table "seller_legal_details", force: :cascade do |t|
    t.string   "s_legal_name"
    t.string   "s_legal_BIN"
    t.string   "s_legal_address"
    t.string   "s_legal_bank_name"
    t.string   "s_legal_bank_BIN"
    t.string   "s_legal_SWIFT"
    t.string   "s_legal_bank_account"
    t.string   "s_legal_CEO"
    t.integer  "seller_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "seller_legal_details", ["seller_id"], name: "index_seller_legal_details_on_seller_id"

  create_table "sellers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "seller_name"
    t.string   "seller_rep_name"
    t.string   "seller_address1"
    t.string   "seller_address2"
    t.string   "seller_address3"
    t.string   "seller_phone"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "sellers", ["confirmation_token"], name: "index_sellers_on_confirmation_token", unique: true
  add_index "sellers", ["email"], name: "index_sellers_on_email", unique: true
  add_index "sellers", ["reset_password_token"], name: "index_sellers_on_reset_password_token", unique: true

  create_table "store_legal_details", force: :cascade do |t|
    t.string   "st_legal_name"
    t.string   "store_legal_BIN"
    t.string   "store_legal_address"
    t.string   "store_legal_bank_name"
    t.string   "store_legal_bank_BIN"
    t.string   "store_legal_SWIFT"
    t.string   "store_legal_bank_account"
    t.string   "store_legal_CEO"
    t.integer  "store_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "store_legal_details", ["store_id"], name: "index_store_legal_details_on_store_id"

  create_table "stores", force: :cascade do |t|
    t.string   "store_name"
    t.string   "store_description"
    t.string   "store_IDproject"
    t.string   "store_enabled"
    t.string   "store_IdUser"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "subscribers", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.string   "transaction_date"
    t.string   "transaction_amount"
    t.string   "transaction_buyers_email"
    t.integer  "seller_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "transactions", ["seller_id"], name: "index_transactions_on_seller_id"

  create_table "travel_premia", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "courier_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "travel_premia", ["courier_id"], name: "index_travel_premia_on_courier_id"
  add_index "travel_premia", ["order_id"], name: "index_travel_premia_on_order_id"

  create_table "travel_standards", force: :cascade do |t|
    t.string   "route_type"
    t.integer  "order_id"
    t.integer  "courier_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "travel_standards", ["courier_id"], name: "index_travel_standards_on_courier_id"
  add_index "travel_standards", ["order_id"], name: "index_travel_standards_on_order_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "warehouse_legal_details", force: :cascade do |t|
    t.string   "w_legal_name"
    t.string   "w_legal_BIN"
    t.string   "w_legal_address"
    t.string   "w_legal_bank_name"
    t.string   "w_legal_bank_BIN"
    t.string   "w_legal_SWIFT"
    t.string   "w_legal_bank_account"
    t.string   "w_legal_CEO"
    t.integer  "warehouse_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "warehouse_legal_details", ["warehouse_id"], name: "index_warehouse_legal_details_on_warehouse_id"

  create_table "warehouses", force: :cascade do |t|
    t.string   "warehouse_name"
    t.string   "warehouse_location"
    t.string   "warehouse_manager"
    t.string   "warehouse_phone"
    t.string   "warehouse_email"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

end
