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

ActiveRecord::Schema.define(version: 20170711233528) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidates", force: :cascade do |t|
    t.bigint "office_id"
    t.string "first_name"
    t.string "last_name"
    t.string "party"
    t.string "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "challenger", default: false
    t.index ["office_id"], name: "index_candidates_on_office_id"
  end

  create_table "dashboards", force: :cascade do |t|
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_dashboards_on_organization_id"
  end

  create_table "incumbents", force: :cascade do |t|
    t.bigint "office_id"
    t.string "first_name"
    t.string "last_name"
    t.string "party"
    t.string "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["office_id"], name: "index_incumbents_on_office_id"
  end

  create_table "members", force: :cascade do |t|
    t.bigint "organization_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_members_on_organization_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "offices", force: :cascade do |t|
    t.string "title"
    t.string "level"
    t.string "term"
    t.bigint "voter_guide_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["voter_guide_id"], name: "index_offices_on_voter_guide_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "organization_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "voter_guides", force: :cascade do |t|
    t.bigint "organization_id"
    t.string "election_name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "year"
    t.index ["organization_id"], name: "index_voter_guides_on_organization_id"
  end

  add_foreign_key "candidates", "offices"
  add_foreign_key "dashboards", "organizations"
  add_foreign_key "incumbents", "offices"
  add_foreign_key "members", "organizations"
  add_foreign_key "members", "users"
  add_foreign_key "offices", "voter_guides"
  add_foreign_key "voter_guides", "organizations"
end
