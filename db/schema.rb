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

ActiveRecord::Schema[7.1].define(version: 2024_12_05_140821) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "compositions", force: :cascade do |t|
    t.string "title"
    t.string "video_url"
    t.text "description"
    t.bigint "musician_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["musician_id"], name: "index_compositions_on_musician_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.text "content"
    t.bigint "musician_id", null: false
    t.bigint "composition_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["composition_id"], name: "index_feedbacks_on_composition_id"
    t.index ["musician_id"], name: "index_feedbacks_on_musician_id"
  end

  create_table "forums", force: :cascade do |t|
    t.string "title"
    t.bigint "musician_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.index ["musician_id"], name: "index_forums_on_musician_id"
  end

  create_table "instruments", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "musician_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["musician_id"], name: "index_instruments_on_musician_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "forum_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["forum_id"], name: "index_messages_on_forum_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "musicians", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.string "address"
  end

  create_table "posts", force: :cascade do |t|
    t.text "content"
    t.bigint "forum_id", null: false
    t.bigint "musician_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["forum_id"], name: "index_posts_on_forum_id"
    t.index ["musician_id"], name: "index_posts_on_musician_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "compositions", "musicians", on_delete: :cascade
  add_foreign_key "feedbacks", "compositions"
  add_foreign_key "feedbacks", "musicians"
  add_foreign_key "forums", "musicians"
  add_foreign_key "instruments", "musicians"
  add_foreign_key "messages", "forums"
  add_foreign_key "messages", "users"
  add_foreign_key "posts", "forums"
  add_foreign_key "posts", "musicians"
end
