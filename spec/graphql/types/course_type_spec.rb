require 'rails_helper'

RSpec.describe Types::CourseType, type: :graphql do
  describe 'fields' do
    it 'returns fields of given course' do
      nested_fields = ['sections']
      fields = described_class.fields.keys.excluding(nested_fields)
      course = create(:course)
      query = <<-GQL
        {
          course(slug: "#{course.slug}") {
            #{fields.join("\n")}
            #{nested_fields.map { |field| "#{field} {id}" }.join("\n")}
          }
        }
      GQL
      course_data = fields.excluding(nested_fields).each_with_object({}) do |field, hash|
        hash[field] = course.send(field.underscore.to_sym)
      end.merge!(Hash[nested_fields.map { |field| [field, []] }])
      expect(response_data_of_gql_execution(query)['course'])
        .to eq(graphql_response_data_format(course_data))
    end
  end
end
