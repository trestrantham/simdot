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

ActiveRecord::Schema.define(version: 20130405172044) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "context_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "context_maps", force: true do |t|
    t.integer  "contextable_id"
    t.string   "contextable_type"
    t.integer  "context_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contexts", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dataflows", force: true do |t|
    t.integer  "dataset_id"
    t.integer  "interface_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "frequency_id"
  end

  create_table "datasets", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "frequencies", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interfaces", force: true do |t|
    t.integer  "source_system_id"
    t.integer  "target_system_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "systems", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
