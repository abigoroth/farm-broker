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
ActiveRecord::Schema.define(version: 20161005072431) do

  create_table "bidders", force: :cascade do |t|
    t.string   "name"
    t.date     "dob"
    t.string   "address"
    t.string   "phone"
    t.string   "credit_card"
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
    t.integer  "district_id"
    t.index ["district_id"], name: "index_bidders_on_district_id"
    t.index ["email"], name: "index_bidders_on_email", unique: true
    t.index ["reset_password_token"], name: "index_bidders_on_reset_password_token", unique: true
  end

  create_table "brokers", force: :cascade do |t|
    t.string   "name"
    t.date     "dob"
    t.string   "address"
    t.string   "phone"
    t.string   "account_no"
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
    t.integer  "district_id"
    t.index ["district_id"], name: "index_brokers_on_district_id"
    t.index ["email"], name: "index_brokers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_brokers_on_reset_password_token", unique: true
=======
<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20161005075532) do

  create_table "districts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
=======
ActiveRecord::Schema.define(version: 20161005064021) do

  create_table "bid_processes", force: :cascade do |t|
    t.decimal  "price"
    t.datetime "bidding_time"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "bids", force: :cascade do |t|
    t.string   "bid_status"
    t.string   "day"
    t.date     "date"
    t.time     "start_time"
    t.time     "end_time"
    t.decimal  "start_price"
    t.decimal  "highest_price"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
>>>>>>> 8736c6db1764aa93f01dd3feb7d8e9ae0b775426
>>>>>>> 823f4197d064b07d8c193c1959ff8e2cad2bddc1
  end

end
