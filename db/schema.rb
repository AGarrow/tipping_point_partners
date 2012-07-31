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

ActiveRecord::Schema.define(:version => 20120731172641) do

  create_table "announcements", :force => true do |t|
    t.string   "title"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "content"
  end

  add_index "announcements", ["company_id", "created_at"], :name => "index_announcements_on_company_id_and_created_at"

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "print_code"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.text     "blurb"
    t.string   "email_extension"
  end

  add_index "companies", ["email_extension"], :name => "index_companies_on_email_extension"

  create_table "questions", :force => true do |t|
    t.string   "question"
    t.text     "answer"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "print_code"
    t.string   "phone"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.integer  "company_id"
    t.string   "role"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.integer  "roles_mask"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "atoken"
    t.string   "asecret"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "validation_token"
    t.datetime "validation_sent_at"
  end

  add_index "users", ["company_id"], :name => "index_users_on_company_id"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
