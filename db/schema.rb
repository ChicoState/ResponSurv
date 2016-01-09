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

ActiveRecord::Schema.define(version: 20151008170854) do

  create_table "finders", force: :cascade do |t|
    t.string   "question",       limit: 255
    t.boolean  "noneEnabled",    limit: 1
    t.boolean  "multipleChoice", limit: 1
    t.boolean  "timed",          limit: 1
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "finders_items", id: false, force: :cascade do |t|
    t.integer "finder_id", limit: 4, null: false
    t.integer "item_id",   limit: 4, null: false
  end

  add_index "finders_items", ["finder_id", "item_id"], name: "index_finders_items_on_finder_id_and_item_id", using: :btree
  add_index "finders_items", ["item_id", "finder_id"], name: "index_finders_items_on_item_id_and_finder_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  create_table "mc_choices", force: :cascade do |t|
    t.string   "choice",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "mc_choices_questions", id: false, force: :cascade do |t|
    t.integer "mc_question_id", limit: 4, null: false
    t.integer "mc_choice_id",   limit: 4, null: false
  end

  add_index "mc_choices_questions", ["mc_choice_id", "mc_question_id"], name: "index_mc_choices_questions_on_mc_choice_id_and_mc_question_id", using: :btree
  add_index "mc_choices_questions", ["mc_question_id", "mc_choice_id"], name: "index_mc_choices_questions_on_mc_question_id_and_mc_choice_id", using: :btree

  create_table "mc_questions", force: :cascade do |t|
    t.string   "prompt",     limit: 255
    t.integer  "item_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "finder_id",  limit: 4
    t.integer  "timer",      limit: 4
  end

  add_index "mc_questions", ["finder_id"], name: "index_mc_questions_on_finder_id", using: :btree
  add_index "mc_questions", ["item_id"], name: "index_mc_questions_on_item_id", using: :btree

  create_table "mc_responses", force: :cascade do |t|
    t.integer  "mc_question_id", limit: 4
    t.integer  "user_id",        limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "mc_choice_id",   limit: 4
  end

  add_index "mc_responses", ["mc_choice_id"], name: "index_mc_responses_on_mc_choice_id", using: :btree
  add_index "mc_responses", ["mc_question_id"], name: "index_mc_responses_on_mc_question_id", using: :btree
  add_index "mc_responses", ["user_id"], name: "index_mc_responses_on_user_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "orderable",      limit: 4
    t.integer  "question_id",    limit: 4
    t.string   "question_type",  limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "mc_question_id", limit: 4
    t.integer  "finder_id",      limit: 4
  end

  add_index "orders", ["finder_id"], name: "index_orders_on_finder_id", using: :btree
  add_index "orders", ["mc_question_id"], name: "index_orders_on_mc_question_id", using: :btree
  add_index "orders", ["question_type", "question_id"], name: "index_orders_on_question_type_and_question_id", using: :btree

  create_table "selections", force: :cascade do |t|
    t.integer  "item_id",    limit: 4
    t.integer  "finder_id",  limit: 4
    t.integer  "user_id",    limit: 4
    t.integer  "row",        limit: 4
    t.integer  "column",     limit: 4
    t.integer  "count",      limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.boolean  "selected",   limit: 1
    t.datetime "local_time"
  end

  add_index "selections", ["finder_id"], name: "index_selections_on_finder_id", using: :btree
  add_index "selections", ["item_id"], name: "index_selections_on_item_id", using: :btree
  add_index "selections", ["user_id"], name: "index_selections_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",         limit: 255
    t.string   "password_digest",  limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "current_question", limit: 4
  end

end
