module Mutations
  class UpdateParamsType < Types::BaseInputObject
    argument :url, String, required: false
    argument :description, String, required: false
  end
end
