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

ActiveRecord::Schema.define(version: 20171209130148) do

  create_table "carriages", force: :cascade do |t|
    t.string   "number"
    t.integer  "top_seats",         default: 0
    t.integer  "bottom_seats",      default: 0
    t.integer  "side_top_seats",    default: 0
    t.integer  "side_bottom_seats", default: 0
    t.integer  "seats",             default: 0
    t.string   "type"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "train_id"
  end

  add_index "carriages", ["train_id"], name: "index_carriages_on_train_id"

  create_table "railway_stations", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railway_stations_routes", force: :cascade do |t|
    t.integer "railway_station_id",             null: false
    t.integer "route_id",                       null: false
    t.integer "position",           default: 0
    t.time    "arrival_time"
    t.time    "departure_time"
  end

  add_index "railway_stations_routes", ["railway_station_id"], name: "index_railway_stations_routes_on_railway_station_id"
  add_index "railway_stations_routes", ["route_id"], name: "index_railway_stations_routes_on_route_id"

  create_table "routes", force: :cascade do |t|
    t.string "name"
  end

  create_table "tickets", force: :cascade do |t|
    t.string   "number"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "train_id"
    t.integer  "user_id"
    t.integer  "departure_station_id"
    t.integer  "destination_station_id"
    t.string   "passenger_name"
    t.string   "passport_number"
  end

  create_table "trains", force: :cascade do |t|
    t.string   "number"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "current_station_id"
    t.integer  "route_id"
    t.boolean  "head_sort",          default: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
