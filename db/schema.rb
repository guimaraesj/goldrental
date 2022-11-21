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

ActiveRecord::Schema[7.0].define(version: 2022_11_21_165051) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "min_rent_duration"
    t.float "weight"
    t.string "material"
    t.float "product_price"
    t.float "rent_cost"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "rents", force: :cascade do |t|
    t.float "total_value"
    t.integer "duration"
    t.bigint "product_id", null: false
    t.bigint "user_id", null: false
    t.boolean "approval_state"
    t.string "credit_card"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_rents_on_product_id"
    t.index ["user_id"], name: "index_rents_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "rent_id", null: false
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rent_id"], name: "index_reviews_on_rent_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "description"
    t.string "localization"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "products", "users"
  add_foreign_key "rents", "products"
  add_foreign_key "rents", "users"
  add_foreign_key "reviews", "rents"
end
