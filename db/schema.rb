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

ActiveRecord::Schema.define(version: 20171004213252) do

  create_table "cars", force: :cascade do |t|
    t.string   "manufacturer",  null: false
    t.string   "model",         null: false
    t.string   "style",         null: false
    t.float    "hourly_rate",   null: false
    t.text     "location",      null: false
    t.string   "license_plate"
    t.string   "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "carstatus"
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "user_id"
    t.integer  "car_id"
    t.boolean  "current",    default: true
    t.boolean  "status",     default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.float    "rent"
    t.index ["car_id"], name: "index_reservations_on_car_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "address"
    t.integer  "age"
    t.string   "license_number"
    t.string   "credit_card_number"
    t.string   "role",               default: "Customer"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

end
