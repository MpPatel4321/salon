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

ActiveRecord::Schema.define(version: 2022_03_26_173542) do

  create_table "appointments", force: :cascade do |t|
    t.datetime "on_time"
    t.datetime "off_time"
    t.integer "shop_id", null: false
    t.integer "service_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["service_id"], name: "index_appointments_on_service_id"
    t.index ["shop_id"], name: "index_appointments_on_shop_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "service_name", null: false
    t.integer "price", null: false
    t.datetime "taken_time", null: false
    t.integer "shop_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id"], name: "index_services_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "shop_name", null: false
    t.integer "chairs", null: false
    t.datetime "opening_time", null: false
    t.datetime "closing_time", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_shops_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "first_name", null: false
    t.string "last_name"
    t.string "role", default: "user"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appointments", "services"
  add_foreign_key "appointments", "shops"
  add_foreign_key "appointments", "users"
  add_foreign_key "services", "shops"
  add_foreign_key "shops", "users"
end
