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

ActiveRecord::Schema.define(version: 20170914073935) do

  create_table "character_references", force: :cascade do |t|
    t.integer "person_id"
    t.string "name"
    t.string "contact"
    t.string "profession"
    t.string "company"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_character_references_on_person_id"
  end

  create_table "educations", force: :cascade do |t|
    t.string "education_level"
    t.string "year_attended"
    t.integer "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "school_name"
    t.index ["person_id"], name: "index_educations_on_person_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.string "company"
    t.string "task"
    t.string "year_employed"
    t.string "position"
    t.integer "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_experiences_on_person_id"
  end

  create_table "objectives", force: :cascade do |t|
    t.integer "person_id"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_objectives_on_person_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "middle_name"
    t.string "age"
    t.string "gender"
    t.date "birthday"
    t.string "mother_name"
    t.string "father_name"
    t.string "status"
    t.string "height"
    t.string "weight"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "main_address"
    t.string "provincial_address"
    t.string "mobile_number"
    t.string "landline_number"
    t.string "avatar"
  end

  create_table "skills", force: :cascade do |t|
    t.string "competency"
    t.string "skill_name"
    t.integer "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_skills_on_person_id"
  end

end
