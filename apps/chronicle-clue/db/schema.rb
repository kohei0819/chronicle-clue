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

ActiveRecord::Schema.define(version: 2020_09_30_184332) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "name_jpn"
    t.string "mark"
    t.integer "parent"
    t.integer "sort"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "content_categories", force: :cascade do |t|
    t.bigint "content_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_content_categories_on_category_id"
    t.index ["content_id"], name: "index_content_categories_on_content_id"
  end

  create_table "content_countries", force: :cascade do |t|
    t.bigint "content_id", null: false
    t.bigint "country_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["content_id"], name: "index_content_countries_on_content_id"
    t.index ["country_id"], name: "index_content_countries_on_country_id"
  end

  create_table "content_images", force: :cascade do |t|
    t.bigint "content_id", null: false
    t.string "path"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["content_id"], name: "index_content_images_on_content_id"
  end

  create_table "content_languages", force: :cascade do |t|
    t.bigint "content_id", null: false
    t.bigint "language_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["content_id"], name: "index_content_languages_on_content_id"
    t.index ["language_id"], name: "index_content_languages_on_language_id"
  end

  create_table "content_movies", force: :cascade do |t|
    t.bigint "content_id", null: false
    t.string "path"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["content_id"], name: "index_content_movies_on_content_id"
  end

  create_table "contents", force: :cascade do |t|
    t.bigint "medium_id", null: false
    t.string "name"
    t.string "name_jpn"
    t.string "name_kana"
    t.text "introduction"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["medium_id"], name: "index_contents_on_medium_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "name_jpn"
    t.integer "sort"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "films", force: :cascade do |t|
    t.bigint "content_id", null: false
    t.text "outline"
    t.text "story"
    t.string "original"
    t.string "website"
    t.date "opendate"
    t.integer "running_time"
    t.string "productino"
    t.string "distributed"
    t.string "budget"
    t.string "box_office"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["content_id"], name: "index_films_on_content_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.string "name_jpn"
    t.integer "sort"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "media", force: :cascade do |t|
    t.string "name"
    t.string "name_jpn"
    t.string "mark"
    t.integer "sort"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "people", force: :cascade do |t|
    t.bigint "content_id", null: false
    t.integer "gender"
    t.integer "blood"
    t.date "birthday"
    t.string "come_from"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["content_id"], name: "index_people_on_content_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "name_jpn"
    t.integer "sort"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_details", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "nickname"
    t.integer "sex"
    t.string "blood"
    t.date "birthday"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_details_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "content_categories", "categories"
  add_foreign_key "content_categories", "contents"
  add_foreign_key "content_countries", "contents"
  add_foreign_key "content_countries", "countries"
  add_foreign_key "content_images", "contents"
  add_foreign_key "content_languages", "contents"
  add_foreign_key "content_languages", "languages"
  add_foreign_key "content_movies", "contents"
  add_foreign_key "contents", "media"
  add_foreign_key "films", "contents"
  add_foreign_key "people", "contents"
  add_foreign_key "user_details", "users"
end
