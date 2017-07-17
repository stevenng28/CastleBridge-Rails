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

ActiveRecord::Schema.define(version: 20170112034711) do

  create_table "bridge_statuses", force: :cascade do |t|
    t.datetime "closed",     default: '2017-07-17 05:00:30'
    t.datetime "open",       default: '2017-07-17 05:00:30'
    t.datetime "closing",    default: '2017-07-17 05:00:30'
    t.datetime "opening",    default: '2017-07-17 05:00:30'
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "notify_to",      default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "toggle_token"
    t.boolean  "morning_notify", default: false
  end

  create_table "warnings", force: :cascade do |t|
    t.string   "status"
    t.boolean  "suppressed",       default: false
    t.integer  "minutes_open",     default: 0
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "suppressed_by_id"
  end

end
