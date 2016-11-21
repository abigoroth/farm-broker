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

ActiveRecord::Schema.define(version: 20161109110440) do

  create_table "bid_processes", force: :cascade do |t|
    t.decimal  "price"
    t.integer  "bid_id"
    t.integer  "bidder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bidders", force: :cascade do |t|
    t.string   "name"
    t.datetime "dob"
    t.string   "address"
    t.string   "phone"
    t.string   "credit_card"
    t.string   "time_zone",   default: "UTC"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "bids", force: :cascade do |t|
    t.string   "bid_status"
    t.datetime "start_time"
    t.datetime "end_time"
    t.decimal  "start_price"
    t.decimal  "highest_price"
    t.decimal  "max_price"
    t.integer  "produce_id"
    t.integer  "bidder_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "farmer_id"
  end

  create_table "brokers", force: :cascade do |t|
    t.string   "name"
    t.datetime "dob"
    t.string   "address"
    t.string   "phone"
    t.string   "account_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chat_rooms", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["receiver_id"], name: "index_chat_rooms_on_receiver_id"
    t.index ["sender_id"], name: "index_chat_rooms_on_sender_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "comment_message"
    t.datetime "comment_date"
    t.integer  "broker_id"
    t.integer  "wallpost_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "farmers", force: :cascade do |t|
    t.string   "name"
    t.datetime "dob"
    t.string   "address"
    t.string   "phone"
    t.string   "account_no"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "company_name"
    t.string   "company_phone"
  end

  create_table "farmsites", force: :cascade do |t|
    t.string   "farmsitename"
    t.integer  "farmsitesize"
    t.text     "farmsiteaddress"
    t.string   "farmsiteownername"
    t.integer  "farmsiteownerphoneno"
    t.integer  "district_id"
    t.integer  "farmer_id"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "farmsitedescription"
    t.string   "farmsitecity"
    t.string   "farmsitestate"
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "friend_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friendships_on_friend_id"
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "chat_room_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["chat_room_id"], name: "index_messages_on_chat_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "places", force: :cascade do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.string   "name"
    t.string   "address"
    t.string   "title"
    t.float    "distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "produces", force: :cascade do |t|
    t.string   "producename"
    t.string   "producetype"
    t.datetime "producedate"
    t.integer  "producequantity"
    t.text     "producedescription"
    t.integer  "farmsite_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "produceimage"
    t.integer  "farmer_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.datetime "produceharvest"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.text     "comment"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "farmsite_id"
    t.index ["farmsite_id"], name: "index_reviews_on_farmsite_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                     default: "",    null: false
    t.string   "encrypted_password",        default: "",    null: false
    t.integer  "meta_id"
    t.string   "meta_type"
    t.string   "timezone",                  default: "UTC"
    t.string   "profilephoto_file_name"
    t.string   "profilephoto_content_type"
    t.integer  "profilephoto_file_size"
    t.datetime "profilephoto_updated_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",             default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.float    "longitude"
    t.float    "latitude"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wallposts", force: :cascade do |t|
    t.string   "wall_status"
    t.datetime "wall_date"
    t.integer  "broker_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
