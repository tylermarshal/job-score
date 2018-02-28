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

ActiveRecord::Schema.define(version: 20180228190309) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "citext"

  create_table "cover_letter_document_tones", force: :cascade do |t|
    t.bigint "cover_letter_id"
    t.decimal "score"
    t.string "tone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cover_letter_id"], name: "index_cover_letter_document_tones_on_cover_letter_id"
  end

  create_table "cover_letter_entities", force: :cascade do |t|
    t.bigint "cover_letter_id"
    t.citext "entity"
    t.decimal "salience"
    t.decimal "magnitude"
    t.decimal "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cover_letter_id"], name: "index_cover_letter_entities_on_cover_letter_id"
  end

  create_table "cover_letter_sentence_tones", force: :cascade do |t|
    t.bigint "cover_letter_id"
    t.text "sentence"
    t.decimal "score"
    t.string "tone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cover_letter_id"], name: "index_cover_letter_sentence_tones_on_cover_letter_id"
  end

  create_table "cover_letter_sentiments", force: :cascade do |t|
    t.text "sentence"
    t.decimal "magnitude"
    t.decimal "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "cover_letter_id"
    t.index ["cover_letter_id"], name: "index_cover_letter_sentiments_on_cover_letter_id"
  end

  create_table "cover_letters", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.citext "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "word_count"
    t.index ["user_id"], name: "index_cover_letters_on_user_id"
  end

  create_table "job_entities", force: :cascade do |t|
    t.bigint "job_id"
    t.citext "entity"
    t.decimal "salience"
    t.decimal "magnitude"
    t.string "wikipedia"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "multiplier"
    t.index ["job_id"], name: "index_job_entities_on_job_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.bigint "user_id"
    t.citext "company_name"
    t.string "job_title"
    t.citext "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "resume_entities", force: :cascade do |t|
    t.bigint "resume_id"
    t.citext "entity"
    t.decimal "salience"
    t.decimal "magnitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resume_id"], name: "index_resume_entities_on_resume_id"
  end

  create_table "resumes", force: :cascade do |t|
    t.bigint "user_id"
    t.citext "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "word_count"
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

  add_foreign_key "cover_letter_document_tones", "cover_letters"
  add_foreign_key "cover_letter_entities", "cover_letters"
  add_foreign_key "cover_letter_sentence_tones", "cover_letters"
  add_foreign_key "cover_letter_sentiments", "cover_letters"
  add_foreign_key "cover_letters", "users"
  add_foreign_key "job_entities", "jobs"
  add_foreign_key "jobs", "users"
  add_foreign_key "resume_entities", "resumes"
  add_foreign_key "resumes", "users"
end
