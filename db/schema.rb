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

ActiveRecord::Schema.define(version: 20160301210634) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "username"
    t.string   "profile_pic_url"
    t.text     "bio"
    t.string   "type"
    t.string   "genere"
    t.string   "business_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer  "venue_id"
    t.string   "name"
    t.integer  "ticket_price"
    t.integer  "ticket_max"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.text     "description"
    t.datetime "showtime"
  end

  add_index "events", ["venue_id"], name: "index_events_on_venue_id", using: :btree

  create_table "gatherings", force: :cascade do |t|
    t.string   "name"
    t.integer  "artist_id"
    t.text     "description"
    t.datetime "showtime"
  end

  add_index "gatherings", ["artist_id"], name: "index_gatherings_on_artist_id", using: :btree

  create_table "login_credentials", force: :cascade do |t|
    t.integer  "loginable_id"
    t.string   "loginable_type"
    t.string   "password_hash"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "login_credentials", ["loginable_id"], name: "index_login_credentials_on_loginable_id", using: :btree

  create_table "patrons", force: :cascade do |t|
    t.string   "name"
    t.string   "username"
    t.string   "email"
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "patrons", ["name"], name: "index_patrons_on_name", using: :btree

  create_table "stripe_credentials", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "uid"
    t.string   "auth_token"
    t.string   "auth_secret"
    t.string   "currency"
    t.string   "account_type"
    t.string   "account_status"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "stripe_credentials", ["uid"], name: "index_stripe_credentials_on_uid", using: :btree
  add_index "stripe_credentials", ["user_id"], name: "index_stripe_credentials_on_user_id", using: :btree

  create_table "twitter_credentials", force: :cascade do |t|
    t.integer "user_id"
    t.string  "uid"
    t.string  "auth_token"
    t.string  "auth_secret"
  end

  add_index "twitter_credentials", ["uid"], name: "index_twitter_credentials_on_uid", using: :btree
  add_index "twitter_credentials", ["user_id"], name: "index_twitter_credentials_on_user_id", using: :btree

  create_table "venues", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "username"
    t.string   "profile_pic_url"
    t.text     "bio"
    t.string   "type"
    t.string   "business_name"
    t.string   "genere"
    t.integer  "capacity"
    t.string   "address"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
