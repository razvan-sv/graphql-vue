class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :plot
      t.integer :year
      t.string :rated
      t.datetime :released_at
      t.integer :runtime
      t.string :director
      t.text :awards
      t.text :poster_url
      t.string :metascore
      t.decimal :imdb_rating
      t.string :imdb_votes
      t.string :imdb_id
      t.string :gross
      t.string :website_url
      t.references :production_house
      t.timestamps
    end
  end
end
