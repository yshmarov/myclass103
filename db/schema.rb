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

ActiveRecord::Schema.define(version: 20160118205329) do

  create_table "attendance_rates", force: :cascade do |t|
    t.string   "name"
    t.float    "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "email"
    t.string   "phone"
    t.string   "website"
    t.string   "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offices", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "email"
    t.string   "phone"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "offices", ["company_id"], name: "index_offices_on_company_id"

  create_table "rooms", force: :cascade do |t|
    t.string   "name"
    t.integer  "office_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rooms", ["office_id"], name: "index_rooms_on_office_id"

  create_table "service_names", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
