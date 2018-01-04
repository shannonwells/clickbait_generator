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

ActiveRecord::Schema.define(version: 20171020022400) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adjectives", id: :serial, force: :cascade do |t|
    t.string "value"
  end

  create_table "clickbaits", id: :serial, force: :cascade do |t|
    t.string "headline"
    t.string "headline_type"
    t.text "tags", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
  end

  create_table "firsts", id: :serial, force: :cascade do |t|
    t.string "value"
  end

  create_table "nexts", id: :serial, force: :cascade do |t|
    t.string "value"
  end

  create_table "nouns", id: :serial, force: :cascade do |t|
    t.string "value"
    t.boolean "is_proper", default: false
    t.boolean "is_agent", default: false
  end

  create_table "particles", id: :serial, force: :cascade do |t|
    t.string "value"
    t.boolean "is_singular", default: true
  end

  create_table "predicates", id: :serial, force: :cascade do |t|
    t.string "value"
  end

  create_table "superlatives", id: :serial, force: :cascade do |t|
    t.string "value"
  end

  create_table "verbs", id: :serial, force: :cascade do |t|
    t.string "value"
    t.boolean "needs_agent", default: true
  end

end
