module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    include FirebaseAuth

    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject

    private

    def current_user
      context[:current_user]
    end

    def session
      context[:session]
    end

    def require_user_login!
      raise GraphQL::ExecutionError.new('ログインが必要です。', extensions: { code: 404 }) if current_user.blank?
    end
  end
end
