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

ActiveRecord::Schema.define(version: 20150915233002) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dog_rental_requests", force: :cascade do |t|
    t.integer  "dog_id",                         null: false
    t.date     "start_date",                     null: false
    t.date     "end_date",                       null: false
    t.string   "status",     default: "PENDING", null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "dog_rental_requests", ["dog_id"], name: "index_dog_rental_requests_on_dog_id", using: :btree

  create_table "dogs", force: :cascade do |t|
    t.string   "name",                  null: false
    t.date     "birth_date",            null: false
    t.string   "color",                 null: false
    t.string   "sex",         limit: 1, null: false
    t.text     "description",           null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "dogs", ["birth_date"], name: "index_dogs_on_birth_date", using: :btree
  add_index "dogs", ["color"], name: "index_dogs_on_color", using: :btree
  add_index "dogs", ["name"], name: "index_dogs_on_name", using: :btree
  add_index "dogs", ["sex"], name: "index_dogs_on_sex", using: :btree

end
