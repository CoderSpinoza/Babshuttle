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

ActiveRecord::Schema.define(version: 20130917004706) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "addresses", force: true do |t|
    t.integer  "user_id"
    t.string   "street"
    t.string   "apt"
    t.string   "zipcode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city"
    t.string   "state"
  end

  add_index "addresses", ["street", "apt", "zipcode"], name: "index_addresses_on_street_and_apt_and_zipcode", using: :btree

  create_table "brands", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delivery_sessions", force: true do |t|
    t.string   "day"
    t.string   "location"
    t.integer  "start"
    t.integer  "end"
    t.integer  "driver_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deliverysessions", force: true do |t|
    t.string  "day"
    t.integer "end",       limit: 2, default: 0
    t.string  "location"
    t.integer "start",     limit: 2, default: 0
    t.integer "driver_id"
  end

  add_index "deliverysessions", ["driver_id"], name: "deliverysessions_driver_id_index", using: :btree

  create_table "in_app_purchase_products", force: true do |t|
    t.string   "product_identifier",                null: false
    t.string   "type",                              null: false
    t.string   "title",                             null: false
    t.string   "description"
    t.float    "price"
    t.string   "price_locale"
    t.boolean  "is_enabled",         default: true
    t.tsvector "tsv"
  end

  add_index "in_app_purchase_products", ["product_identifier"], name: "in_app_purchase_products_product_identifier_index", using: :btree
  add_index "in_app_purchase_products", ["tsv"], name: "in_app_purchase_products_tsv_index", using: :gin
  add_index "in_app_purchase_products", ["type"], name: "in_app_purchase_products_type_index", using: :btree

  create_table "in_app_purchase_receipts", force: true do |t|
    t.integer  "quantity"
    t.string   "product_id",                  null: false
    t.string   "transaction_id",              null: false
    t.datetime "purchase_date",               null: false
    t.string   "original_transaction_id"
    t.datetime "original_purchase_date"
    t.string   "app_item_id"
    t.string   "version_external_identifier"
    t.string   "bid"
    t.string   "bvrs"
    t.inet     "ip_address"
    t.datetime "created_at"
    t.tsvector "tsv"
  end

  add_index "in_app_purchase_receipts", ["app_item_id"], name: "in_app_purchase_receipts_app_item_id_index", using: :btree
  add_index "in_app_purchase_receipts", ["product_id"], name: "in_app_purchase_receipts_product_id_index", using: :btree
  add_index "in_app_purchase_receipts", ["transaction_id"], name: "in_app_purchase_receipts_transaction_id_index", using: :btree
  add_index "in_app_purchase_receipts", ["tsv"], name: "in_app_purchase_receipts_tsv_index", using: :gin

  create_table "in_app_purchase_schema_info", id: false, force: true do |t|
    t.integer "version", default: 0, null: false
  end

  create_table "items", force: true do |t|
    t.string   "name"
    t.float    "price"
    t.string   "unit"
    t.float    "amount"
    t.integer  "brand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "popularity"
    t.integer  "store_id"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "newsstand_issues", force: true do |t|
    t.string   "name"
    t.string   "title"
    t.string   "summary"
    t.text     "tags",         array: true
    t.hstore   "metadata"
    t.hstore   "cover_urls"
    t.text     "asset_urls",   array: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "published_at"
    t.datetime "expires_at"
    t.tsvector "tsv"
  end

  add_index "newsstand_issues", ["name"], name: "newsstand_issues_name_index", using: :btree
  add_index "newsstand_issues", ["name"], name: "newsstand_issues_name_key", unique: true, using: :btree
  add_index "newsstand_issues", ["published_at"], name: "newsstand_issues_published_at_index", using: :btree
  add_index "newsstand_issues", ["tsv"], name: "newsstand_issues_tsv_index", using: :gin

  create_table "newsstand_schema_info", id: false, force: true do |t|
    t.integer "version", default: 0, null: false
  end

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "items",                         default: ""
    t.datetime "time"
    t.integer  "address_id"
    t.string   "phone_number"
    t.string   "items_string"
    t.integer  "end_hour",            limit: 2, default: 0
    t.integer  "start_hour",          limit: 2, default: 0
    t.integer  "delivery_session_id"
    t.datetime "date"
    t.integer  "end",                 limit: 2, default: 0
    t.integer  "start",               limit: 2, default: 0
  end

  create_table "passbook_passes", force: true do |t|
    t.string   "pass_type_identifier"
    t.string   "serial_number"
    t.string   "authentication_token"
    t.hstore   "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.tsvector "tsv"
  end

  add_index "passbook_passes", ["pass_type_identifier"], name: "passbook_passes_pass_type_identifier_index", using: :btree
  add_index "passbook_passes", ["pass_type_identifier"], name: "passbook_passes_pass_type_identifier_key", unique: true, using: :btree
  add_index "passbook_passes", ["serial_number"], name: "passbook_passes_serial_number_index", using: :btree
  add_index "passbook_passes", ["tsv"], name: "passbook_passes_tsv_index", using: :gin

  create_table "passbook_registrations", force: true do |t|
    t.integer  "pass_id",                   limit: 8, null: false
    t.string   "device_library_identifier"
    t.string   "push_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "passbook_registrations", ["device_library_identifier"], name: "passbook_registrations_device_library_identifier_index", using: :btree

  create_table "passbook_schema_info", id: false, force: true do |t|
    t.integer "version", default: 0, null: false
  end

  create_table "push_notification_devices", force: true do |t|
    t.string   "token"
    t.string   "alias"
    t.integer  "badge",      default: 0,     null: false
    t.string   "locale"
    t.string   "language"
    t.string   "timezone",   default: "UTC"
    t.inet     "ip_address"
    t.float    "lat"
    t.float    "lng"
    t.text     "tags",                                    array: true
    t.tsvector "tsv"
  end

  add_index "push_notification_devices", ["alias"], name: "push_notification_devices_alias_index", using: :btree
  add_index "push_notification_devices", ["lat", "lng"], name: "push_notification_devices_lat_lng_index", using: :btree
  add_index "push_notification_devices", ["token"], name: "push_notification_devices_token_index", using: :btree
  add_index "push_notification_devices", ["token"], name: "push_notification_devices_token_key", unique: true, using: :btree
  add_index "push_notification_devices", ["tsv"], name: "push_notification_devices_tsv_index", using: :gin

  create_table "push_notification_schema_info", id: false, force: true do |t|
    t.integer "version", default: 0, null: false
  end

  create_table "stores", force: true do |t|
    t.string "name"
  end

  create_table "users", force: true do |t|
    t.string   "email",                            default: "",     null: false
    t.string   "encrypted_password",               default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                    default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.string   "name"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone_number"
    t.string   "role",                             default: "user"
    t.string   "password"
    t.string   "password_confirmation"
    t.integer  "end_hour",               limit: 2, default: 0
    t.string   "location"
    t.integer  "start_hour",             limit: 2, default: 0
    t.string   "passwordConfirmation"
    t.string   "phoneNumber"
    t.integer  "orders_id"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
