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

ActiveRecord::Schema.define(version: 2021_08_08_142710) do

  create_table "enterprises", force: :cascade do |t|
    t.string "name", null: false
    t.string "name_kana", null: false
    t.string "established", null: false
    t.string "capital", null: false
    t.string "annual_sales", null: false
    t.string "president", null: false
    t.string "business_content"
    t.boolean "is_active", default: true, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_enterprises_on_email", unique: true
    t.index ["reset_password_token"], name: "index_enterprises_on_reset_password_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_kana", null: false
    t.date "birthday", null: false
    t.integer "gender", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "specialized_field"
    t.integer "number"
    t.integer "manufacturing_status"
    t.integer "purchasing_status"
    t.integer "quality_management_status"
    t.integer "food_labeling_status"
    t.integer "management_status"
    t.text "notice"
    t.string "desired_salary"
    t.string "preferred_workplace"
    t.string "desired_field"
    t.string "timing"
    t.text "request"
    t.text "job_career"
    t.text "job_summary"
    t.boolean "is_active", default: true, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
