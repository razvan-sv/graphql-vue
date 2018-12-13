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

ActiveRecord::Schema.define(version: 2018_12_10_142355) do

  create_table "actors", force: :cascade do |t|
    t.string "full_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "actors_movies", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "actor_id"
    t.index ["movie_id", "actor_id"], name: "index_actors_movies_on_movie_id_and_actor_id", unique: true
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres_movies", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "genre_id"
    t.index ["movie_id", "genre_id"], name: "index_genres_movies_on_movie_id_and_genre_id", unique: true
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages_movies", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "language_id"
    t.index ["movie_id", "language_id"], name: "index_languages_movies_on_movie_id_and_language_id", unique: true
  end

  create_table "links", force: :cascade do |t|
    t.string "url"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movie_ratings", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "source_id"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id", "source_id"], name: "index_movie_ratings_on_movie_id_and_source_id", unique: true
    t.index ["movie_id"], name: "index_movie_ratings_on_movie_id"
    t.index ["source_id"], name: "index_movie_ratings_on_source_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.text "plot"
    t.integer "year"
    t.string "rated"
    t.datetime "released_at"
    t.integer "runtime"
    t.string "director"
    t.text "awards"
    t.text "poster_url"
    t.string "metascore"
    t.decimal "imdb_rating"
    t.string "imdb_votes"
    t.string "imdb_id"
    t.string "gross"
    t.string "website_url"
    t.integer "production_house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["production_house_id"], name: "index_movies_on_production_house_id"
  end

  create_table "movies_ratings", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "rating_id"
    t.index ["movie_id", "rating_id"], name: "index_movies_ratings_on_movie_id_and_rating_id", unique: true
  end

  create_table "production_houses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sources", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
