# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :uid, ID, null: false
    field :email, String, null: true
  end
end
