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

ActiveRecord::Schema.define(version: 20160525012656) do

  create_table "preorders", force: :cascade do |t|
    t.integer  "project_id",         limit: 4
    t.string   "name",               limit: 255
    t.string   "email",              limit: 255
    t.string   "boards",             limit: 255
    t.string   "kits",               limit: 255
    t.string   "assembled",          limit: 255
    t.string   "address",            limit: 255
    t.string   "confirmation_token", limit: 255
    t.string   "sti_type",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "printable_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "enabled"
  end

  create_table "recaptcha_failures", force: :cascade do |t|
    t.string   "challenge_timestamp", limit: 255
    t.string   "hostname",            limit: 255
    t.string   "address",             limit: 255
    t.string   "error_codes",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
