module Types
  class MovieType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :description, String, null: false
    field :short_description, String, null: false
    field :year, String, null: false
    field :rated, String, null: true
    field :released_at, String, null: true
    field :runtime, String, null: false
    field :director, String, null: false
    field :awards, String, null: true
    field :poster_url, String, null: true
    field :metascore, Integer, null: true
    field :imdb_rating, Float, null: false
    field :imdb_votes, String, null: false
    field :income, String, null: true
    field :website_url, String, null: true
    field :genres, [Types::GenreType], null: false

    def short_description
      object.plot.truncate(250)
    end

    def description
      object.plot
    end

    def runtime
      "#{object.runtime / 60} min"
    end

    def income
      object.gross
    end

    def released_at
      object.released_at.strftime("%d %B %Y")
    end
  end
end
