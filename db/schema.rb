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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20161018042152) do
=======
ActiveRecord::Schema.define(version: 20161014030006) do
>>>>>>> df7ae9febddbcfed70bda0c1dbeeb35592cc31a1

  create_table "bid_processes", force: :cascade do |t|
    t.decimal  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "bid_id"
    t.integer  "bidder_id"
    t.index ["bid_id"], name: "index_bid_processes_on_bid_id"
    t.index ["bidder_id"], name: "index_bid_processes_on_bidder_id"
  end

  create_table "bidders", force: :cascade do |t|
    t.string   "name"
    t.date     "dob"
    t.string   "address"
    t.string   "phone"
    t.string   "credit_card"
    t.string   "email",                     default: "",    null: false
    t.string   "encrypted_password",        default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",             default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.text     "profilephoto"
    t.string   "profilephoto_file_name"
    t.string   "profilephoto_content_type"
    t.integer  "profilephoto_file_size"
    t.datetime "profilephoto_updated_at"
    t.string   "time_zone",                 default: "UTC"
    t.index ["email"], name: "index_bidders_on_email", unique: true
    t.index ["reset_password_token"], name: "index_bidders_on_reset_password_token", unique: true
  end

  create_table "bids", force: :cascade do |t|
    t.string   "bid_status"
    t.datetime "start_time"
    t.datetime "end_time"
    t.decimal  "start_price"
    t.decimal  "highest_price"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "broker_id"
    t.integer  "produce_id"
    t.integer  "bidder_id"
    t.decimal  "max_price"
    t.index ["bidder_id"], name: "index_bids_on_bidder_id"
    t.index ["broker_id"], name: "index_bids_on_broker_id"
    t.index ["produce_id"], name: "index_bids_on_produce_id"
  end

  create_table "brokers", force: :cascade do |t|
    t.string   "name"
    t.date     "dob"
    t.string   "address"
    t.string   "phone"
    t.string   "account_no"
    t.string   "email",                     default: "", null: false
    t.string   "encrypted_password",        default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",             default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.text     "profilephoto"
    t.string   "profilephoto_file_name"
    t.string   "profilephoto_content_type"
    t.integer  "profilephoto_file_size"
    t.datetime "profilephoto_updated_at"
    t.index ["email"], name: "index_brokers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_brokers_on_reset_password_token", unique: true
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "comment_message"
    t.datetime "comment_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "wallpost_id"
    t.integer  "broker_id"
    t.index ["broker_id"], name: "index_comments_on_broker_id"
    t.index ["wallpost_id"], name: "index_comments_on_wallpost_id"
  end

  create_table "farmsites", force: :cascade do |t|
    t.string   "farmsitename"
    t.integer  "farmsitesize"
    t.text     "farmsiteaddress"
    t.string   "farmsiteownername"
    t.integer  "farmsiteownerphoneno"
    t.integer  "district_id"
    t.integer  "broker_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "latitude"
    t.string   "longitude"
  end

  create_table "places", force: :cascade do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.string   "name"
    t.string   "address"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "distance"
  end

  create_table "produces", force: :cascade do |t|
    t.string   "producename"
    t.string   "producetype"
    t.datetime "producedate"
    t.integer  "producequantity"
    t.text     "producedescription"
    t.integer  "farmsite_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "produceimage"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "broker_id"
    t.index ["broker_id"], name: "index_produces_on_broker_id"
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  create_table "users", force: :cascade do |t|
    t.float    "latitude"
    t.float    "longtitude"
    t.string   "name"
    t.text     "address"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wallposts", force: :cascade do |t|
    t.string   "wall_status"
    t.datetime "wall_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "broker_id"
    t.index ["broker_id"], name: "index_wallposts_on_broker_id"
  end

=======
>>>>>>> df7ae9febddbcfed70bda0c1dbeeb35592cc31a1
end
