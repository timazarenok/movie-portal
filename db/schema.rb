# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_09_110130) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "biography"
    t.string "date_of_birth", null: false
    t.string "image"
    t.bigint "country_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_actors_on_country_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "directors", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "biography"
    t.date "date_of_birth", null: false
    t.string "image"
    t.bigint "country_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_directors_on_country_id"
  end

  create_table "favorites_user_movies", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "movie_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_favorites_user_movies_on_movie_id"
    t.index ["user_id"], name: "index_favorites_user_movies_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.string "likeable_type", null: false
    t.bigint "likeable_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["likeable_type", "likeable_id"], name: "index_likes_on_likeable_type_and_likeable_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "name", null: false
    t.string "image", null: false
    t.string "description", limit: 500
    t.string "clip", null: false
    t.date "release_date", null: false
    t.time "duration"
    t.bigint "category_id", null: false
    t.bigint "director_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_movies_on_category_id"
    t.index ["director_id"], name: "index_movies_on_director_id"
  end

  create_table "movies_actors", force: :cascade do |t|
    t.bigint "movie_id", null: false
    t.bigint "actor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["actor_id"], name: "index_movies_actors_on_actor_id"
    t.index ["movie_id"], name: "index_movies_actors_on_movie_id"
  end

  create_table "movies_countries", force: :cascade do |t|
    t.bigint "movie_id", null: false
    t.bigint "country_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_movies_countries_on_country_id"
    t.index ["movie_id"], name: "index_movies_countries_on_movie_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", limit: 500
    t.string "image", null: false
    t.time "duration", null: false
    t.integer "number", limit: 2, null: false
    t.bigint "serial_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["serial_id"], name: "index_seasons_on_serial_id"
  end

  create_table "seasons_actors", force: :cascade do |t|
    t.bigint "season_id", null: false
    t.bigint "actor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["actor_id"], name: "index_seasons_actors_on_actor_id"
    t.index ["season_id"], name: "index_seasons_actors_on_season_id"
  end

  create_table "serial_countries", force: :cascade do |t|
    t.bigint "serial_id", null: false
    t.bigint "actor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["actor_id"], name: "index_serial_countries_on_actor_id"
    t.index ["serial_id"], name: "index_serial_countries_on_serial_id"
  end

  create_table "serials", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", limit: 500
    t.string "clip", null: false
    t.date "release_date", null: false
    t.time "duration"
    t.bigint "category_id", null: false
    t.bigint "director_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_serials_on_category_id"
    t.index ["director_id"], name: "index_serials_on_director_id"
  end

  create_table "series", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", limit: 500
    t.string "image"
    t.time "duration", null: false
    t.integer "number", null: false
    t.bigint "season_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["season_id"], name: "index_series_on_season_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "actors", "countries"
  add_foreign_key "directors", "countries"
  add_foreign_key "favorites_user_movies", "movies"
  add_foreign_key "favorites_user_movies", "users"
  add_foreign_key "likes", "users"
  add_foreign_key "movies", "categories"
  add_foreign_key "movies", "directors"
  add_foreign_key "movies_actors", "actors"
  add_foreign_key "movies_actors", "movies"
  add_foreign_key "movies_countries", "countries"
  add_foreign_key "movies_countries", "movies"
  add_foreign_key "seasons", "serials"
  add_foreign_key "seasons_actors", "actors"
  add_foreign_key "seasons_actors", "seasons"
  add_foreign_key "serial_countries", "actors"
  add_foreign_key "serial_countries", "serials"
  add_foreign_key "serials", "categories"
  add_foreign_key "serials", "directors"
  add_foreign_key "series", "seasons"
end
