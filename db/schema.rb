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

ActiveRecord::Schema.define(version: 20170105032837) do

  create_table "preorders", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "project_id",         limit: 36
    t.string   "name"
    t.string   "email"
    t.string   "boards"
    t.string   "kits"
    t.string   "assembled"
    t.string   "address"
    t.string   "confirmation_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "confirmed"
    t.index ["project_id"], name: "index_preorders_on_project_id", using: :btree
  end

  create_table "projects", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "printable_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "enabled"
  end

  create_table "recaptcha_failures", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "challenge_timestamp"
    t.string   "hostname"
    t.string   "address"
    t.string   "error_codes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
