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

ActiveRecord::Schema.define(version: 20160413214514) do

  create_table "matches", force: :cascade do |t|
    t.integer "round_id"
    t.integer "player1_id"
    t.integer "player2_id"
    t.integer "sub1_id"
    t.integer "sub2_id"
  end

  add_index "matches", ["player1_id"], name: "index_matches_on_player1_id"
  add_index "matches", ["player2_id"], name: "index_matches_on_player2_id"
  add_index "matches", ["round_id"], name: "index_matches_on_round_id"

  create_table "players", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "suffix"
    t.string   "number"
    t.string   "flight"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.boolean  "active"
    t.integer  "starting_average"
  end

  create_table "points", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "match_id"
    t.integer  "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "points", ["match_id"], name: "index_points_on_match_id"
  add_index "points", ["player_id"], name: "index_points_on_player_id"

  create_table "rounds", force: :cascade do |t|
    t.date     "date"
    t.string   "course"
    t.string   "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scores", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "match_id"
    t.integer  "value"
    t.integer  "adj_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "scores", ["match_id"], name: "index_scores_on_match_id"
  add_index "scores", ["player_id"], name: "index_scores_on_player_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "hashed_password"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
