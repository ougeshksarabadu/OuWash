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

ActiveRecord::Schema[7.1].define(version: 2024_03_07_120431) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.datetime "date"
    t.string "location"
    t.bigint "car_wash_id", null: false
    t.bigint "car_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "approval", default: false
    t.index ["car_id"], name: "index_appointments_on_car_id"
    t.index ["car_wash_id"], name: "index_appointments_on_car_wash_id"
  end

  create_table "car_washes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "location"
    t.integer "price_sedan"
    t.integer "price_suv"
    t.integer "price_truck"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_luxury"
    t.string "description"
    t.index ["user_id"], name: "index_car_washes_on_user_id"
  end

  create_table "cars", force: :cascade do |t|
    t.string "brand"
    t.integer "year"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "car_type"
    t.index ["user_id"], name: "index_cars_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.boolean "owner", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appointments", "car_washes"
  add_foreign_key "appointments", "cars"
  add_foreign_key "car_washes", "users"
  add_foreign_key "cars", "users"
end
