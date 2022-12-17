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

ActiveRecord::Schema[7.0].define(version: 2022_12_16_052708) do
  create_table "announcement_students", force: :cascade do |t|
    t.integer "announcement_id", null: false
    t.integer "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["announcement_id"], name: "index_announcement_students_on_announcement_id"
    t.index ["student_id"], name: "index_announcement_students_on_student_id"
  end

  create_table "announcements", force: :cascade do |t|
    t.integer "school_id", null: false
    t.datetime "start"
    t.datetime "end"
    t.string "title"
    t.text "content"
    t.boolean "read"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_announcements_on_school_id"
  end

  create_table "families", force: :cascade do |t|
    t.integer "school_id", null: false
    t.string "login_id"
    t.string "password_digest"
    t.string "name"
    t.string "email"
    t.string "address"
    t.string "tel"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_families_on_school_id"
  end

  create_table "lesson_students", force: :cascade do |t|
    t.integer "lesson_id", null: false
    t.integer "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_lesson_students_on_lesson_id"
    t.index ["student_id"], name: "index_lesson_students_on_student_id"
  end

  create_table "lesson_teachers", force: :cascade do |t|
    t.integer "lesson_id", null: false
    t.integer "teacher_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_lesson_teachers_on_lesson_id"
    t.index ["teacher_id"], name: "index_lesson_teachers_on_teacher_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.integer "school_id", null: false
    t.integer "room_id", null: false
    t.string "name"
    t.datetime "start"
    t.datetime "end"
    t.text "content"
    t.integer "hourly_pay"
    t.integer "monthly_pay"
    t.date "month"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_lessons_on_room_id"
    t.index ["school_id"], name: "index_lessons_on_school_id"
  end

  create_table "managers", force: :cascade do |t|
    t.string "login_id"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "school_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_rooms_on_school_id"
  end

  create_table "schools", force: :cascade do |t|
    t.integer "manager_id", null: false
    t.string "login_id"
    t.string "password_digest"
    t.string "name"
    t.string "email"
    t.string "address"
    t.string "tel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manager_id"], name: "index_schools_on_manager_id"
  end

  create_table "students", force: :cascade do |t|
    t.integer "school_id", null: false
    t.integer "family_id", null: false
    t.string "login_id"
    t.string "password_digest"
    t.string "name"
    t.string "email"
    t.string "tel"
    t.date "birthday"
    t.string "school_name"
    t.string "grade"
    t.date "admission_date"
    t.date "expulsion_date"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["family_id"], name: "index_students_on_family_id"
    t.index ["school_id"], name: "index_students_on_school_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "school_id", null: false
    t.integer "teacher_id", null: false
    t.integer "student_id", null: false
    t.datetime "start"
    t.datetime "finish"
    t.datetime "end"
    t.text "content"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_tasks_on_school_id"
    t.index ["student_id"], name: "index_tasks_on_student_id"
    t.index ["teacher_id"], name: "index_tasks_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.integer "school_id", null: false
    t.string "login_id"
    t.string "password_digest"
    t.string "name"
    t.string "email"
    t.string "address"
    t.string "tel"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_teachers_on_school_id"
  end

  create_table "tuitions", force: :cascade do |t|
    t.integer "school_id", null: false
    t.integer "family_id", null: false
    t.string "title"
    t.date "month"
    t.integer "amount"
    t.date "deadline_date"
    t.date "payment_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["family_id"], name: "index_tuitions_on_family_id"
    t.index ["school_id"], name: "index_tuitions_on_school_id"
  end

  add_foreign_key "announcement_students", "announcements"
  add_foreign_key "announcement_students", "students"
  add_foreign_key "announcements", "schools"
  add_foreign_key "families", "schools"
  add_foreign_key "lesson_students", "lessons"
  add_foreign_key "lesson_students", "students"
  add_foreign_key "lesson_teachers", "lessons"
  add_foreign_key "lesson_teachers", "teachers"
  add_foreign_key "lessons", "rooms"
  add_foreign_key "lessons", "schools"
  add_foreign_key "rooms", "schools"
  add_foreign_key "schools", "managers"
  add_foreign_key "students", "families"
  add_foreign_key "students", "schools"
  add_foreign_key "tasks", "schools"
  add_foreign_key "tasks", "students"
  add_foreign_key "tasks", "teachers"
  add_foreign_key "teachers", "schools"
  add_foreign_key "tuitions", "families"
  add_foreign_key "tuitions", "schools"
end
