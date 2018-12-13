module Mutations
  class UpdateLink < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :params, Mutations::UpdateParamsType, required: true

    field :link, Types::LinkType, null: false
    field :errors, [String], null: false

    def resolve(id:, params:)
      link = Link.find(id)
      Rails.logger.info("=============#{params.to_h}")
      if link.update_attributes(params.to_h)
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
