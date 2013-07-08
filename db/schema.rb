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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130708231219) do

  create_table "station_proximities", :force => true do |t|
    t.integer  "station_id"
    t.integer  "nearby_station_id"
    t.decimal  "distance",          :precision => 24, :scale => 20
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
  end

  add_index "station_proximities", ["nearby_station_id"], :name => "index_station_proximities_on_nearby_station_id"
  add_index "station_proximities", ["station_id"], :name => "index_station_proximities_on_station_id"

  create_table "station_snapshots", :force => true do |t|
    t.integer  "station_id"
    t.string   "status"
    t.integer  "available_bike_count"
    t.integer  "available_dock_count"
    t.datetime "created_at"
    t.integer  "station_summary_id"
  end

  add_index "station_snapshots", ["station_summary_id"], :name => "index_station_snapshots_on_station_summary_id"
  add_index "station_snapshots", ["status"], :name => "index_station_snapshots_on_status"

  create_table "station_summaries", :force => true do |t|
    t.integer  "active_stations"
    t.integer  "total_stations"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "last_update",     :limit => 8
  end

  add_index "station_summaries", ["last_update"], :name => "index_station_summaries_on_last_update"

  create_table "stations", :force => true do |t|
    t.integer  "citibike_station_id"
    t.decimal  "latitude",            :precision => 24, :scale => 20
    t.decimal  "longitude",           :precision => 24, :scale => 20
    t.string   "label"
    t.string   "address"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
  end

  add_index "stations", ["citibike_station_id"], :name => "index_stations_on_citibike_station_id"
  add_index "stations", ["latitude"], :name => "index_stations_on_latitude"
  add_index "stations", ["longitude"], :name => "index_stations_on_longitude"

  create_table "versions", :force => true do |t|
    t.string   "item_type",  :null => false
    t.integer  "item_id",    :null => false
    t.string   "event",      :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

end
