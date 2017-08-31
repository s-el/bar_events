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

ActiveRecord::Schema.define(version: 20170830201155) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["event_id"], name: "index_attendances_on_event_id", using: :btree
    t.index ["user_id"], name: "index_attendances_on_user_id", using: :btree
  end

  create_table "bars", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.string   "description"
    t.string   "website"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.float    "latitude"
    t.float    "longitude"
    t.index ["user_id"], name: "index_bars_on_user_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "category"
    t.string   "title"
    t.string   "description"
    t.date     "date"
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "bar_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["bar_id"], name: "index_events_on_bar_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.string   "content"
    t.integer  "attendance_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["attendance_id"], name: "index_reviews_on_attendance_id", using: :btree
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "attendances", "users"
  add_foreign_key "bars", "users"
  add_foreign_key "events", "bars"
  add_foreign_key "reviews", "attendances"
end
