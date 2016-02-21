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

ActiveRecord::Schema.define(version: 20160221010540) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.datetime "start"
    t.integer  "priority"
    t.boolean  "flag"
    t.text     "imageURL"
    t.text     "url"
    t.datetime "end"
    t.text     "ort"
    t.text     "description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "event_category_id"
    t.integer  "recurrence_id"
    t.boolean  "repeats"
  end

  add_index "events", ["event_category_id"], name: "index_events_on_event_category_id", using: :btree
  add_index "events", ["recurrence_id"], name: "index_events_on_recurrence_id", using: :btree

  create_table "events_roles", id: false, force: :cascade do |t|
    t.integer "event_id"
    t.integer "role_id"
  end

  add_index "events_roles", ["event_id", "role_id"], name: "index_events_roles_on_event_id_and_role_id", using: :btree

  create_table "excludes", force: :cascade do |t|
    t.date     "date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "recurrence_id"
  end

  add_index "excludes", ["recurrence_id"], name: "index_excludes_on_recurrence_id", using: :btree

  create_table "recurrences", force: :cascade do |t|
    t.date     "start"
    t.date     "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "rules", force: :cascade do |t|
    t.integer  "day"
    t.integer  "recurrence_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "week"
    t.integer  "month"
    t.integer  "days"
  end

  add_index "rules", ["recurrence_id"], name: "index_rules_on_recurrence_id", using: :btree

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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  add_foreign_key "events", "event_categories"
  add_foreign_key "events", "recurrences"
  add_foreign_key "excludes", "recurrences"
  add_foreign_key "rules", "recurrences", on_delete: :cascade
end
