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

ActiveRecord::Schema.define(version: 2019_05_26_182043) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "kind"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "contents", force: :cascade do |t|
    t.bigint "study_group_id"
    t.string "document"
    t.string "image"
    t.integer "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.index ["study_group_id"], name: "index_contents_on_study_group_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.bigint "institution_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["institution_id"], name: "index_courses_on_institution_id"
  end

  create_table "courses_subjects", force: :cascade do |t|
    t.bigint "course_id"
    t.bigint "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_courses_subjects_on_course_id"
    t.index ["subject_id"], name: "index_courses_subjects_on_subject_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "description"
    t.date "date"
    t.bigint "courses_subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["courses_subject_id"], name: "index_events_on_courses_subject_id"
  end

  create_table "institutions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questionnaire_answers", force: :cascade do |t|
    t.bigint "questionnaire_id"
    t.bigint "questionnaire_option_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["questionnaire_id"], name: "index_questionnaire_answers_on_questionnaire_id"
    t.index ["questionnaire_option_id"], name: "index_questionnaire_answers_on_questionnaire_option_id"
    t.index ["user_id"], name: "index_questionnaire_answers_on_user_id"
  end

  create_table "questionnaire_options", force: :cascade do |t|
    t.bigint "questionnaire_id"
    t.boolean "correct"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["questionnaire_id"], name: "index_questionnaire_options_on_questionnaire_id"
  end

  create_table "questionnaires", force: :cascade do |t|
    t.bigint "subject_id"
    t.string "description"
    t.bigint "institution_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["institution_id"], name: "index_questionnaires_on_institution_id"
    t.index ["subject_id"], name: "index_questionnaires_on_subject_id"
  end

  create_table "study_groups", force: :cascade do |t|
    t.bigint "institution_id"
    t.string "name"
    t.bigint "subject_id"
    t.string "theme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["institution_id"], name: "index_study_groups_on_institution_id"
    t.index ["subject_id"], name: "index_study_groups_on_subject_id"
  end

  create_table "study_groups_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "study_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["study_group_id"], name: "index_study_groups_users_on_study_group_id"
    t.index ["user_id"], name: "index_study_groups_users_on_user_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "subject_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.bigint "institution_id"
    t.bigint "course_id"
    t.integer "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "authentication_token", limit: 30
    t.bigint "study_group_id"
    t.string "profile_picture"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["course_id"], name: "index_users_on_course_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["institution_id"], name: "index_users_on_institution_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["study_group_id"], name: "index_users_on_study_group_id"
  end

  create_table "worktimes", force: :cascade do |t|
    t.time "start_time"
    t.time "end_time"
    t.integer "day"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_worktimes_on_user_id"
  end

  add_foreign_key "attendances", "users"
  add_foreign_key "contents", "study_groups"
  add_foreign_key "courses", "institutions"
  add_foreign_key "courses_subjects", "courses"
  add_foreign_key "courses_subjects", "subjects"
  add_foreign_key "events", "courses_subjects"
  add_foreign_key "questionnaire_answers", "questionnaire_options"
  add_foreign_key "questionnaire_answers", "questionnaires"
  add_foreign_key "questionnaire_answers", "users"
  add_foreign_key "questionnaire_options", "questionnaires"
  add_foreign_key "questionnaires", "institutions"
  add_foreign_key "questionnaires", "subjects"
  add_foreign_key "study_groups", "institutions"
  add_foreign_key "study_groups", "subjects"
  add_foreign_key "study_groups_users", "study_groups"
  add_foreign_key "study_groups_users", "users"
  add_foreign_key "users", "courses"
  add_foreign_key "users", "institutions"
  add_foreign_key "users", "study_groups"
  add_foreign_key "worktimes", "users"
end
