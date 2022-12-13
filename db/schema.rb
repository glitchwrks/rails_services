# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2020_06_27_181337) do
  create_table "application_settings", id: { type: :string, limit: 36 }, charset: "latin1", collation: "latin1_swedish_ci", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "value"
    t.string "sti_type"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["name"], name: "index_application_settings_on_name"
  end

  create_table "messages", id: { type: :string, limit: 36 }, charset: "latin1", collation: "latin1_swedish_ci", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "subject"
    t.text "content"
    t.string "address"
    t.boolean "suspicious"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "pastes", id: { type: :string, limit: 36 }, charset: "latin1", collation: "latin1_swedish_ci", force: :cascade do |t|
    t.string "name", limit: 8, null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preorders", id: { type: :string, limit: 36 }, charset: "latin1", collation: "latin1_swedish_ci", force: :cascade do |t|
    t.string "project_id", limit: 36
    t.string "name"
    t.string "email"
    t.string "boards"
    t.string "kits"
    t.string "assembled"
    t.string "address"
    t.string "confirmation_token"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "confirmed"
    t.index ["confirmation_token"], name: "index_preorders_on_confirmation_token"
    t.index ["project_id"], name: "index_preorders_on_project_id"
  end

  create_table "projects", id: { type: :string, limit: 36 }, charset: "latin1", collation: "latin1_swedish_ci", force: :cascade do |t|
    t.string "name"
    t.string "printable_name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "enabled"
    t.index ["name"], name: "index_projects_on_name"
  end

  create_table "recaptcha_failures", id: { type: :string, limit: 36 }, charset: "latin1", collation: "latin1_swedish_ci", force: :cascade do |t|
    t.string "challenge_timestamp"
    t.string "hostname"
    t.string "address"
    t.string "error_codes"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "action"
  end

  create_table "testfdc_notes", id: { type: :string, limit: 36 }, charset: "latin1", collation: "latin1_swedish_ci", force: :cascade do |t|
    t.integer "number"
    t.string "description"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "testfdc_results", id: { type: :string, limit: 36 }, charset: "latin1", collation: "latin1_swedish_ci", force: :cascade do |t|
    t.string "manufacturer"
    t.string "model"
    t.string "fdc_chip"
    t.string "hardware_class"
    t.boolean "fm_250"
    t.boolean "fm_300"
    t.boolean "fm_500"
    t.boolean "mfm_250"
    t.boolean "mfm_300"
    t.boolean "mfm_500"
    t.boolean "mfm_250_128"
    t.boolean "mfm_300_128"
    t.boolean "mfm_500_128"
    t.boolean "approved"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "note_id"
    t.text "initial_report_notes"
    t.index ["note_id"], name: "index_testfdc_results_on_note_id"
  end

  create_table "users", id: { type: :string, limit: 36 }, charset: "latin1", collation: "latin1_swedish_ci", force: :cascade do |t|
    t.string "login"
    t.string "password_digest"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "api_access"
  end

end
