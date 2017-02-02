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

ActiveRecord::Schema.define(version: 20161223211047) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "breeds", force: :cascade do |t|
    t.string   "breed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colors", force: :cascade do |t|
    t.string   "color"
    t.string   "hex"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dogs", force: :cascade do |t|
    t.integer  "breed_id"
    t.integer  "color_id"
    t.text     "description"
    t.string   "gender"
    t.string   "size"
    t.string   "age"
    t.string   "picture"
    t.date     "date"
    t.time     "time"
    t.string   "status"
    t.integer  "user_id"
    t.integer  "reward"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "dogs", ["breed_id"], name: "index_dogs_on_breed_id", using: :btree
  add_index "dogs", ["color_id"], name: "index_dogs_on_color_id", using: :btree
  add_index "dogs", ["user_id"], name: "index_dogs_on_user_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "dog_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "address"
  end

  add_index "locations", ["dog_id"], name: "index_locations_on_dog_id", using: :btree
  add_index "locations", ["user_id"], name: "index_locations_on_user_id", using: :btree

  create_table "successes", force: :cascade do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.float    "time_lost"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "address"
  end

  add_index "successes", ["user_id"], name: "index_successes_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "dogs", "breeds"
  add_foreign_key "dogs", "colors"
  add_foreign_key "dogs", "users"
  add_foreign_key "locations", "dogs"
  add_foreign_key "locations", "users"
  add_foreign_key "successes", "users"
end
