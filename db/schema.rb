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

ActiveRecord::Schema[7.0].define(version: 2023_09_29_125831) do
  create_table "buys", force: :cascade do |t|
    t.string "about"
    t.integer "price"
    t.integer "phone_no"
    t.string "landmark"
    t.string "property_type"
    t.string "address"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_buys_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.string "commentable_type", null: false
    t.integer "commentable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable"
  end

  create_table "images", force: :cascade do |t|
    t.string "imageable_type", null: false
    t.integer "imageable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profile_img"
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable"
  end

  create_table "loans", force: :cascade do |t|
    t.string "name"
    t.string "details"
    t.integer "buy_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buy_id"], name: "index_loans_on_buy_id"
  end

  create_table "rents", force: :cascade do |t|
    t.string "about"
    t.integer "price"
    t.integer "phone_no"
    t.string "landmark"
    t.string "property_type"
    t.string "address"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_rents_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "buys", "users"
  add_foreign_key "loans", "buys"
  add_foreign_key "rents", "users"
end
