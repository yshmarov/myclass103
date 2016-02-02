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

ActiveRecord::Schema.define(version: 20160121225631) do

  create_table "admins", force: :cascade do |t|
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
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "attendance_rates", force: :cascade do |t|
    t.string   "name"
    t.float    "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attendances", force: :cascade do |t|
    t.integer  "guest_id"
    t.integer  "attendance_rate_id"
    t.integer  "event_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "attendances", ["attendance_rate_id"], name: "index_attendances_on_attendance_rate_id"
  add_index "attendances", ["event_id"], name: "index_attendances_on_event_id"
  add_index "attendances", ["guest_id"], name: "index_attendances_on_guest_id"

  create_table "attr1s", force: :cascade do |t|
    t.string   "attr1"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attr2s", force: :cascade do |t|
    t.string   "attr2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attr3s", force: :cascade do |t|
    t.string   "attr3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cash_collections", force: :cascade do |t|
    t.float    "amount"
    t.integer  "office_id"
    t.integer  "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cash_collections", ["admin_id"], name: "index_cash_collections_on_admin_id"
  add_index "cash_collections", ["office_id"], name: "index_cash_collections_on_office_id"

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

  create_table "event_groups", force: :cascade do |t|
    t.string   "name"
    t.string   "status"
    t.integer  "service_id"
    t.integer  "attr1_id"
    t.integer  "attr2_id"
    t.integer  "attr3_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "event_groups", ["attr1_id"], name: "index_event_groups_on_attr1_id"
  add_index "event_groups", ["attr2_id"], name: "index_event_groups_on_attr2_id"
  add_index "event_groups", ["attr3_id"], name: "index_event_groups_on_attr3_id"

  create_table "events", force: :cascade do |t|
    t.datetime "starts_at"
    t.integer  "duration"
    t.integer  "room_id"
    t.integer  "user_id"
    t.integer  "event_group_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "events", ["event_group_id"], name: "index_events_on_event_group_id"
  add_index "events", ["room_id"], name: "index_events_on_room_id"
  add_index "events", ["user_id"], name: "index_events_on_user_id"

  create_table "expences", force: :cascade do |t|
    t.float    "amount"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "expences", ["user_id"], name: "index_expences_on_user_id"

  create_table "guests", force: :cascade do |t|
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
  end

  add_index "guests", ["email"], name: "index_guests_on_email", unique: true
  add_index "guests", ["reset_password_token"], name: "index_guests_on_reset_password_token", unique: true

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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
