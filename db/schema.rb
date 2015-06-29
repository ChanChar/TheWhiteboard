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

ActiveRecord::Schema.define(version: 20150628075424) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text     "description"
    t.integer  "question_id"
    t.string   "time_complexity"
    t.string   "space_complexity"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "hints", force: :cascade do |t|
    t.text     "description"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "hints", ["question_id"], name: "index_hints_on_question_id", using: :btree

  create_table "pairs", force: :cascade do |t|
    t.integer  "user1",      null: false
    t.integer  "user2",      null: false
    t.integer  "user3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pairs", ["user1"], name: "index_pairs_on_user1", using: :btree
  add_index "pairs", ["user2"], name: "index_pairs_on_user2", using: :btree
  add_index "pairs", ["user3"], name: "index_pairs_on_user3", using: :btree

  create_table "problem_sets", force: :cascade do |t|
    t.text     "title"
    t.date     "deploy_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.text     "set_title"
    t.integer  "problem_set_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "questions", ["problem_set_id"], name: "index_questions_on_problem_set_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.string   "github_url"
    t.string   "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["name"], name: "index_users_on_name", using: :btree
  add_index "users", ["provider"], name: "index_users_on_provider", using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

end
