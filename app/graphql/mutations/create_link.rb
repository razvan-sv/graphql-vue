module Mutations
  class CreateLink < Mutations::BaseMutation
    argument :url, String, required: true
    argument :description, String, required: false

    # What it returns
    field :link, Types::LinkType, null: true
    field :errors, [String], null: false

    def resolve(url:, description:)
      link = Link.new(url: url, description: description)
      if link.save
        {
          link: link,
          errors: []
        }
      else
        {
          link: nil,
          errors: link.errors.full_messages
        }
      end
    end
  end
end
