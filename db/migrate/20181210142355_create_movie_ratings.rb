class CreateMovieRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_ratings do |t|
      t.references :movie
      t.references :source
      t.string :value
      t.timestamps
    end

    add_index :movie_ratings, [:movie_id, :source_id], unique: true
  end
end
