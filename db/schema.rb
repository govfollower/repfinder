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

ActiveRecord::Schema.define(version: 2018_02_18_014003) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "districts", force: :cascade do |t|
    t.bigint "state_id"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_districts_on_state_id"
  end

  create_table "house_reps", force: :cascade do |t|
    t.bigint "district_id"
    t.string "propublica_id"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "gender"
    t.date "dob"
    t.string "party"
    t.boolean "in_office"
    t.integer "reelection_year"
    t.integer "first_elected_year"
    t.integer "terms_served"
    t.string "phone"
    t.string "website_url"
    t.string "contact_form_url"
    t.string "twitter_account"
    t.string "facebook_account"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["district_id"], name: "index_house_reps_on_district_id"
  end

  create_table "senate_reps", force: :cascade do |t|
    t.bigint "state_id"
    t.string "propublica_id"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "gender"
    t.date "dob"
    t.string "party"
    t.boolean "in_office"
    t.integer "reelection_year"
    t.integer "first_elected_year"
    t.integer "terms_served"
    t.string "phone"
    t.string "website_url"
    t.string "contact_form_url"
    t.string "twitter_account"
    t.string "facebook_account"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_senate_reps_on_state_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.string "abbr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
