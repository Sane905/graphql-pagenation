module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me

    field :user, Types::UserType, null: false
    def user
      require_user_login!

      current_user
    end

    private

    def current_user
      context[:current_user]
    end

    def require_user_login!
      raise GraphQL::ExecutionError.new('ログインが必要です。', extensions: { code: 404 }) if current_user.blank?
    end
  end
end
