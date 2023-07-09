module Mutations
  class SignUp < BaseMutation
    null false
    type Types::UserType

    argument :email, String, required: true
    argument :password, String, required: true

    def resolve(email:, password:)
      if user = User.find_by(email: email)
        user.password = password
        user.save!
      else
        user = User.create!(email: email, password: password)
      end
      context[:session][:session_uid] = user.uid

      user
    end
  end
end
