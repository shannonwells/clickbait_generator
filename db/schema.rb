# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140914182540) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adjectives", force: true do |t|
    t.string "value"
  end

  create_table "firsts", force: true do |t|
    t.string "value"
  end

  create_table "nexts", force: true do |t|
    t.string "value"
  end

  create_table "nouns", force: true do |t|
    t.string  "value"
    t.boolean "is_proper", default: false
    t.boolean "is_agent",  default: false
  end

  create_table "particles", force: true do |t|
    t.string  "value"
    t.boolean "is_singular", default: true
  end

  create_table "predicates", force: true do |t|
    t.string "value"
  end

  create_table "superlatives", force: true do |t|
    t.string "value"
  end

  create_table "verbs", force: true do |t|
    t.string  "value"
    t.boolean "needs_agent", default: true
  end

end
