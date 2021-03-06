# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140221235000) do

  create_table "albums", force: true do |t|
    t.integer  "band_id",    null: false
    t.string   "album_name", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "albums", ["album_name"], name: "index_albums_on_album_name"
  add_index "albums", ["band_id"], name: "index_albums_on_band_id"

  create_table "bands", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bands", ["name"], name: "index_bands_on_name"

  create_table "notes", force: true do |t|
    t.integer  "user_id",    null: false
    t.text     "body",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "song_id"
  end

  add_index "notes", ["song_id"], name: "index_notes_on_song_id"
  add_index "notes", ["user_id"], name: "index_notes_on_user_id"

  create_table "songs", force: true do |t|
    t.integer  "album_id",    null: false
    t.string   "title",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "bonus_track"
    t.text     "lyrics"
  end

  add_index "songs", ["album_id"], name: "index_songs_on_album_id"
  add_index "songs", ["title"], name: "index_songs_on_title"

  create_table "users", force: true do |t|
    t.string   "email",                            null: false
    t.string   "password_digest",                  null: false
    t.string   "session_token",                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "activated",        default: false
    t.string   "activation_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["session_token"], name: "index_users_on_session_token"
end
