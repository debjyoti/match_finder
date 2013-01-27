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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130127055953) do

  create_table "answers", :force => true do |t|
    t.integer  "question_id"
    t.integer  "option_id"
    t.text     "explanation"
    t.integer  "profile_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.text     "question"
    t.string   "chosen_option"
  end

  add_index "answers", ["profile_id"], :name => "index_answers_on_profile_id"

  create_table "options", :force => true do |t|
    t.string   "option"
    t.integer  "question_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "options", ["question_id"], :name => "index_options_on_question_id"

  create_table "profiles", :force => true do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "gender"
    t.string   "country"
    t.string   "city"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "questions", :force => true do |t|
    t.text     "question"
    t.integer  "weight"
    t.string   "category"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
