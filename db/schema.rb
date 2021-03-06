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

ActiveRecord::Schema.define(version: 20160423184141) do

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
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attr2s", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attr3s", force: :cascade do |t|
    t.string   "name"
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

  create_table "comments", force: :cascade do |t|
    t.string   "text"
    t.integer  "guest_id"
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

  create_table "enrollments", force: :cascade do |t|
    t.integer  "event_group_id"
    t.integer  "user_id"
    t.integer  "guest_id"
    t.integer  "coupon_id"
    t.integer  "opp_status_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "enrollments", ["coupon_id"], name: "index_enrollments_on_coupon_id"
  add_index "enrollments", ["event_group_id"], name: "index_enrollments_on_event_group_id"
  add_index "enrollments", ["guest_id"], name: "index_enrollments_on_guest_id"
  add_index "enrollments", ["opp_status_id"], name: "index_enrollments_on_opp_status_id"
  add_index "enrollments", ["user_id"], name: "index_enrollments_on_user_id"

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
    t.string   "first_name"
    t.string   "second_name"
    t.string   "last_name"
    t.date     "birthday"
    t.string   "sex"
    t.string   "address"
    t.string   "photo"
    t.boolean  "active"
    t.integer  "lead_source_id"
    t.string   "contact_1"
    t.string   "contact_2"
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

  create_table "payments", force: :cascade do |t|
    t.integer  "enrollment_id"
    t.float    "amount"
    t.integer  "office_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "payments", ["enrollment_id"], name: "index_payments_on_enrollment_id"
  add_index "payments", ["office_id"], name: "index_payments_on_office_id"

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

  create_table "services", force: :cascade do |t|
    t.integer  "service_name_id"
    t.integer  "event_quantity"
    t.integer  "event_length"
    t.float    "uprice"
    t.float    "gprice"
    t.string   "gtype"
    t.string   "ctype"
    t.boolean  "is_active"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "services", ["service_name_id"], name: "index_services_on_service_name_id"

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
    t.string   "second_name"
    t.string   "last_name"
    t.date     "birthday"
    t.string   "sex"
    t.string   "address"
    t.string   "photo"
    t.boolean  "active"
    t.string   "contact_1"
    t.string   "contact_2"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
