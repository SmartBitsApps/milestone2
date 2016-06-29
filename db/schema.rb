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

ActiveRecord::Schema.define(version: 20160627081435) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brigades", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "position_id"
    t.integer  "quantity",    default: 0, null: false
    t.boolean  "visible"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "brigades", ["event_id"], name: "index_brigades_on_event_id", using: :btree
  add_index "brigades", ["position_id"], name: "index_brigades_on_position_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "logo"
    t.string   "company_name",   default: "", null: false
    t.string   "email",          default: "", null: false
    t.string   "phone_number",   default: "", null: false
    t.integer  "vat_id"
    t.string   "contact_person"
    t.boolean  "visible"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "clients", ["email"], name: "index_clients_on_email", unique: true, using: :btree

  create_table "events", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "client_id"
    t.string   "title",       default: "", null: false
    t.text     "description", default: "", null: false
    t.string   "image"
    t.string   "start_date",  default: "", null: false
    t.string   "end_date",    default: "", null: false
    t.string   "address",     default: "", null: false
    t.integer  "manager"
    t.boolean  "visible"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "events", ["client_id"], name: "index_events_on_client_id", using: :btree
  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "positions", force: :cascade do |t|
    t.string   "title",        default: "", null: false
    t.text     "description",  default: "", null: false
    t.text     "requirements", default: "", null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "brigade_id"
    t.integer  "user_id"
    t.boolean  "approved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "subscriptions", ["brigade_id"], name: "index_subscriptions_on_brigade_id", using: :btree
  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role"
    t.string   "avatar"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "brigades", "events"
  add_foreign_key "brigades", "positions"
  add_foreign_key "events", "clients"
  add_foreign_key "events", "users"
  add_foreign_key "subscriptions", "brigades"
  add_foreign_key "subscriptions", "users"
end
