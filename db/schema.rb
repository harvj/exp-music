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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120131023914) do

  create_table "album_artists", :force => true do |t|
    t.integer  "release_id"
    t.integer  "artist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "album_artists", ["artist_id"], :name => "index_album_artists_on_artist_id"
  add_index "album_artists", ["release_id"], :name => "index_album_artists_on_release_id"

  create_table "artists", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "genres", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recordings", :force => true do |t|
    t.string   "name"
    t.integer  "length"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "recording_date"
  end

  create_table "release_tracks", :force => true do |t|
    t.integer  "track_no"
    t.integer  "release_id"
    t.integer  "recording_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "release_tracks", ["recording_id"], :name => "index_release_tracks_on_recording_id"
  add_index "release_tracks", ["release_id"], :name => "index_release_tracks_on_release_id"

  create_table "releases", :force => true do |t|
    t.string   "name"
    t.date     "release_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "album_art"
    t.integer  "genre_id"
  end

  add_index "releases", ["genre_id"], :name => "index_releases_on_genre_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
