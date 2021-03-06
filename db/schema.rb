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

ActiveRecord::Schema.define(version: 20150605121652) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "provider"
    t.integer  "user_id"
    t.string   "name"
    t.string   "nickname"
    t.string   "uid"
    t.string   "url"
    t.string   "token"
    t.string   "secret"
    t.string   "profile_img_url"
    t.string   "profile_img_small"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.integer  "user_id"
    t.inet     "ip"
    t.date     "expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "session_id"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", using: :btree
  add_index "sessions", ["user_id"], name: "index_sessions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "full_name"
    t.inet     "last_ip"
    t.date     "last_login"
    t.string   "email"
    t.string   "profile_img"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
