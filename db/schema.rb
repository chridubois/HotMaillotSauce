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

ActiveRecord::Schema[7.0].define(version: 2023_02_28_155223) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jerseys", force: :cascade do |t|
    t.string "team"
    t.string "player"
    t.integer "year"
    t.string "state"
    t.string "description"
    t.string "photo"
    t.integer "number"
    t.float "price_per_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.string "size"
    t.index ["user_id"], name: "index_jerseys_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.date "begin_date"
    t.date "end_date"
    t.bigint "user_id", null: false
    t.bigint "jersey_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "total_amount"
    t.index ["jersey_id"], name: "index_orders_on_jersey_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "firstname"
    t.string "lastname"
    t.string "team"
    t.string "avatar"
    t.string "phone_number"
    t.string "seller_address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "jerseys", "users"
  add_foreign_key "orders", "jerseys"
  add_foreign_key "orders", "users"
end
