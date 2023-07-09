class GraphqlBadRequestError < GraphQL::ExecutionError
    def to_h
      super.merge({ 'extensions' => { 'code' => 400 } })
    end
end
  