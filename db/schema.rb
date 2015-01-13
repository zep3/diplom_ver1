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

ActiveRecord::Schema.define(version: 20150113045705) do

  create_table "subjects", force: true do |t|
    t.string   "name"
    t.integer  "course"
    t.integer  "semester"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tests", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "content"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.integer  "topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tests", ["topic_id"], name: "index_tests_on_topic_id"
  add_index "tests", ["user_id"], name: "index_tests_on_user_id"

  create_table "topics", force: true do |t|
    t.string   "name"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "topics", ["subject_id"], name: "index_topics_on_subject_id"

  create_table "users", force: true do |t|
    t.string   "login"
    t.string   "fio"
    t.text     "groups"
    t.integer  "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
