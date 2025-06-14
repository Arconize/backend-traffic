# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_06_14_094546) do
  create_table "cameras", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "range"
    t.bigint "road_id", null: false
    t.string "status"
    t.string "camera_type"
    t.float "x_position"
    t.float "y_position"
    t.float "angle"
    t.datetime "upgraded_at"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["road_id"], name: "index_cameras_on_road_id"
  end

  create_table "monitors", primary_key: ["camera_id", "veh_plate", "time"], charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "camera_id", null: false
    t.string "veh_plate", limit: 8, null: false
    t.datetime "time", null: false
    t.integer "line"
    t.index ["camera_id"], name: "index_monitors_on_camera_id"
    t.index ["veh_plate"], name: "fk_rails_7643a6207b"
  end

  create_table "road_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "def_max_speed"
    t.integer "def_min_speed"
    t.float "width_def"
    t.integer "line_count_def"
    t.boolean "is_one_way_def"
    t.text "description"
    t.datetime "upgraded_at"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roads", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "road_type_id", null: false
    t.bigint "zone_id", null: false
    t.datetime "upgraded_at"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["road_type_id"], name: "index_roads_on_road_type_id"
    t.index ["zone_id"], name: "index_roads_on_zone_id"
  end

  create_table "vehicles", primary_key: "veh_plate", id: { type: :string, limit: 8 }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "veh_color", limit: 6, null: false
    t.string "veh_type", limit: 6, null: false
    t.date "veh_create_date", null: false
    t.string "veh_pollution_lvl", null: false
    t.string "veh_fuel_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "upgraded_at"
    t.datetime "deleted_at"
  end

  create_table "zone_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "land_name", limit: 20, null: false
    t.integer "def_max_speed", null: false
    t.integer "def_min_speed", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "upgraded_at"
    t.datetime "deleted_at"
  end

  create_table "zones", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "zone_type_id", null: false
    t.datetime "upgraded_at"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["zone_type_id"], name: "index_zones_on_zone_type_id"
  end

  add_foreign_key "cameras", "roads"
  add_foreign_key "monitors", "cameras"
  add_foreign_key "monitors", "vehicles", column: "veh_plate", primary_key: "veh_plate"
  add_foreign_key "roads", "road_types"
  add_foreign_key "roads", "zones"
  add_foreign_key "zones", "zone_types"
end
