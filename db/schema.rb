# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_24_161940) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conferences", force: :cascade do |t|
    t.string "title"
    t.string "location"
    t.string "description"
    t.string "image_url"
    t.datetime "start_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "duration"
  end

  create_table "conferences_speakers", id: false, force: :cascade do |t|
    t.bigint "conference_id", null: false
    t.bigint "speaker_id", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "location"
    t.string "pic"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "razorpay_order_id"
    t.decimal "final_amount"
    t.decimal "discounted_amount"
    t.decimal "discounted_percentage"
    t.decimal "promocode"
    t.integer "quantity"
    t.string "status"
    t.bigint "conference_id", null: false
    t.bigint "ticket_price_id", null: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["conference_id"], name: "index_orders_on_conference_id"
    t.index ["ticket_price_id"], name: "index_orders_on_ticket_price_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "session_id"
    t.integer "conference_id"
    t.float "discounted_amount"
    t.float "final_amount"
    t.string "promocode"
    t.integer "quantity"
    t.string "status"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "promo_codes", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.float "discount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "speakers", force: :cascade do |t|
    t.string "name"
    t.string "role"
    t.string "linkedin_handle"
    t.string "twitter_handle"
    t.string "github_handle"
    t.string "company"
    t.string "company_logo"
    t.string "profile_pic"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "speaker_summary"
    t.datetime "birthday"
    t.string "country"
    t.string "city"
    t.string "about_page"
    t.string "languages_known", default: [], array: true
    t.string "mobile_number"
    t.string "email"
  end

  create_table "talks", force: :cascade do |t|
    t.string "title"
    t.datetime "start_time"
    t.string "description"
    t.bigint "speaker_id"
    t.bigint "conference_id"
    t.string "talk_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "conference_name"
    t.string "speaker_name"
    t.index ["conference_id"], name: "index_talks_on_conference_id"
    t.index ["speaker_id"], name: "index_talks_on_speaker_id"
  end

  create_table "ticket_prices", force: :cascade do |t|
    t.float "price"
    t.bigint "conference_id", null: false
    t.string "ticket_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["conference_id"], name: "index_ticket_prices_on_conference_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "confirm", default: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "is_confirm", default: false
    t.boolean "is_admin", default: false
    t.string "confirmed_at"
    t.string "confirmation_token"
    t.string "remember_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["remember_token"], name: "index_users_on_remember_token"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "orders", "conferences"
  add_foreign_key "orders", "ticket_prices"
  add_foreign_key "orders", "users"
  add_foreign_key "payments", "users"
  add_foreign_key "talks", "conferences"
  add_foreign_key "talks", "speakers"
  add_foreign_key "ticket_prices", "conferences"
end
