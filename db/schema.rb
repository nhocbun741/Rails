# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_02_25_040726) do

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.integer "count_like"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "text_id"
    t.integer "image_id"
    t.index ["image_id"], name: "index_articles_on_image_id"
    t.index ["text_id"], name: "index_articles_on_text_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "headline"
    t.string "url_image"
    t.integer "count_like"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "price", precision: 10, scale: 2
    t.boolean "published"
    t.integer "category_id"
    t.string "level", limit: 7
    t.string "country", limit: 2
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "texts", force: :cascade do |t|
    t.string "headline"
    t.string "sentence"
    t.integer "count_like"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
