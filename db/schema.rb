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

ActiveRecord::Schema.define(version: 20161005022012) do

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
  end

  create_table "produces", force: :cascade do |t|
    t.string   "producename"
    t.string   "producetype"
    t.datetime "producedate"
    t.integer  "producequantity"
    t.text     "producedescription"
    t.integer  "farmsite_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

end
