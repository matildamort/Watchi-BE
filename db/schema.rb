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

ActiveRecord::Schema.define(version: 2022_07_15_064208) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reviews", force: :cascade do |t|
    t.string "message"
    t.integer "rating"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "show_id", null: false
    t.index ["show_id"], name: "index_reviews_on_show_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "shows", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.boolean "crunchyroll"
    t.boolean "netflix"
    t.boolean "funimation"
    t.integer "episodes"
    t.date "airdate"
    t.date "enddate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "review_id"
    t.string "day"
    t.index ["review_id"], name: "index_shows_on_review_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "firstname"
    t.string "lastname"
    t.boolean "admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "watchlists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "show_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["show_id"], name: "index_watchlists_on_show_id"
    t.index ["user_id"], name: "index_watchlists_on_user_id"
  end

  add_foreign_key "reviews", "shows"
  add_foreign_key "reviews", "users"
  add_foreign_key "shows", "reviews"
  add_foreign_key "watchlists", "shows"
  add_foreign_key "watchlists", "users"
end
