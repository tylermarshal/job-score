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

ActiveRecord::Schema.define(version: 20180224020520) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cover_letters", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cover_letters_on_user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.bigint "user_id"
    t.string "company_name"
    t.string "job_title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "resume_entities", force: :cascade do |t|
    t.bigint "resume_id"
    t.string "entity"
    t.decimal "salience"
    t.decimal "magnitude"
    t.string "wikipedia"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resume_id"], name: "index_resume_entities_on_resume_id"
  end

  create_table "resumes", force: :cascade do |t|
    t.bigint "user_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["user_id"], name: "index_resumes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uid"
    t.string "token"
    t.string "token_secret"
    t.string "email"
    t.string "name"
    t.string "expires"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cover_letters", "users"
  add_foreign_key "jobs", "users"
  add_foreign_key "resume_entities", "resumes"
  add_foreign_key "resumes", "users"
end
