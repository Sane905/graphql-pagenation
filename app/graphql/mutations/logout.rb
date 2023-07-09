module Mutations
  class Logout < BaseMutation
   type Boolean

   def resolve
    require_user_login!

    context[:session][:session_uid] = nil
    true
   end
  end
end
