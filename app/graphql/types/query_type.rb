module Types
  class QueryType < Types::BaseObject
    field :movies, [Types::MovieType], null: false, description: 'Return all movies'
    # field :link, Types::LinkType, null: false do
    #   description 'Return a single link'
    #   argument :id, ID, required: true
    # end

    def movies
      Movie.all
    end

    # def link(id:)
    #   Link.find(id)
    # end
  end
end
