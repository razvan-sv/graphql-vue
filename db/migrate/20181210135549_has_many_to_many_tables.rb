class HasManyToManyTables < ActiveRecord::Migration[5.2]
  def change
    create_table :actors_movies do |t|
      t.integer :movie_id
      t.integer :actor_id
    end

    add_index :actors_movies, [:movie_id, :actor_id], unique: true

    create_table :languages_movies do |t|
      t.integer :movie_id
      t.integer :language_id
    end

    add_index :languages_movies, [:movie_id, :language_id], unique: true

    create_table :genres_movies do |t|
      t.integer :movie_id
      t.integer :genre_id
    end

    add_index :genres_movies, [:movie_id, :genre_id], unique: true
  end
end
