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

ActiveRecord::Schema.define(version: 20140926055215) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blogs", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.text     "article"
    t.string   "image_id"
    t.integer  "coach_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coaches", force: true do |t|
    t.string   "name"
    t.string   "position"
    t.text     "info"
    t.string   "ref"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "coaches", ["user_id"], name: "index_coaches_on_user_id", using: :btree

  create_table "comments", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "blog_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "city"
    t.string   "state"
    t.boolean  "admin"
    t.boolean  "subscription"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "password_hash"
    t.string   "password_salt"
  end

  create_table "wrestlers", force: true do |t|
    t.string   "user_id"
    t.string   "name"
    t.string   "weight_class"
    t.string   "year"
    t.string   "state"
    t.string   "masters"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
