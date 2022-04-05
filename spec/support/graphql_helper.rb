module GraphQLHelper
  def response_data_of_gql_execution(graphql, options = {})
    @response_data_of_gql_execution ||= {}
    @response_data_of_gql_execution[[graphql, options]] ||= begin
      execution(graphql, options).fetch('data')&.transform_keys! { |key| key.camelize(:lower) }
    end
  end

  def response_error_of_gql_execution(graphql, options = {})
    @response_error_of_gql_execution ||= {}
    @response_error_of_gql_execution[[graphql, options]] ||= begin
      execution(graphql, options).fetch('errors')
    end
  end

  def execution(graphql, options = {})
    @execution ||= {}
    @execution[[graphql, options]] ||= begin
      ShongkoBackendSchema.execute(graphql, options)
    end
  end

  def graphql_response_data_format(data = {})
    return data unless data.is_a?(Hash)

    data.transform_values do |v|
      if v.respond_to?(:iso8601)
        GraphQL::Types::ISO8601DateTime.coerce_result(v, nil)
      elsif v.is_a?(OpenStruct)
        v.to_h
      elsif v.is_a?(Hash)
        graphql_response_data_format(v)
      elsif v.is_a?(Array)
        v.map { |m| graphql_response_data_format(m) }
      else
        v
      end
    end
  end
end
