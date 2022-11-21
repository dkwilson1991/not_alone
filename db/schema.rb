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

ActiveRecord::Schema[7.0].define(version: 2022_11_21_074332) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.integer "final_volunteer_count"
    t.string "roles"
    t.date "start_date"
    t.date "end_date"
    t.string "status"
    t.bigint "user_id", null: false
    t.bigint "camp_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["camp_id"], name: "index_assignments_on_camp_id"
    t.index ["user_id"], name: "index_assignments_on_user_id"
  end

  create_table "camps", force: :cascade do |t|
    t.string "address"
    t.integer "required_number_volunteers"
    t.date "start_date"
    t.date "end_date"
    t.string "description"
    t.string "images"
    t.string "director_email"
    t.string "comments"
    t.string "camp_name"
    t.string "required_roles"
    t.string "newsfeed_post"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_camps_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "location"
    t.date "birthday"
    t.string "certifications"
    t.string "training"
    t.string "avatar_pic"
    t.string "language"
    t.string "past_roles"
    t.boolean "admin_status"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "assignments", "camps"
  add_foreign_key "assignments", "users"
  add_foreign_key "camps", "users"
end
