module Mutations
  class SignIn < BaseMutation
    null false
    type Types::UserType

    argument :email, String, required: true
    argument :password, String, required: true

    def resolve(email:, password:)
      context[:session][:session_uid] = nil

      begin
        user = User.authenticate(email, password)
      rescue ActiveRecord::RecordNotFound => e
        raise GraphQL::ExecutionError.new(e.message, extensions: { code: 404 })
      end

      context[:session][:session_uid] = user.uid

      user
    end
  end
end
