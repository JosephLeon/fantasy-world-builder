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

ActiveRecord::Schema.define(version: 20131211015316) do

  create_table "areas", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "map"
    t.text     "notes"
    t.integer  "universe_id"
    t.text     "environment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "characters", force: true do |t|
    t.string   "name"
    t.integer  "intelligence"
    t.integer  "patience"
    t.integer  "charisma"
    t.integer  "strength"
    t.integer  "endurance"
    t.integer  "agility"
    t.integer  "constitution"
    t.integer  "gold"
    t.string   "weapon"
    t.text     "description"
    t.text     "history"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "health"
    t.integer  "armor"
    t.integer  "level"
    t.string   "career"
    t.integer  "attack"
    t.integer  "defense"
    t.integer  "perception"
    t.integer  "weight"
    t.integer  "weight_penalty"
    t.string   "race"
    t.string   "clan"
    t.text     "spells"
    t.text     "abilities"
    t.text     "skills"
    t.text     "powers"
    t.text     "languages"
    t.integer  "magic_save"
    t.integer  "mind_save"
    t.integer  "weather_save"
    t.integer  "poison_save"
    t.integer  "force_save"
    t.text     "notes"
    t.integer  "universe_id"
    t.integer  "area_id"
  end

  create_table "items", force: true do |t|
    t.string   "name"
    t.text     "appearance"
    t.integer  "weight"
    t.string   "size"
    t.integer  "damage"
    t.integer  "durability"
    t.text     "powers"
    t.text     "notes"
    t.integer  "character_id"
    t.integer  "monster_id"
    t.integer  "area_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "universes", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "special_rules"
    t.text     "pantheon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
