require 'rails_helper'

RSpec.describe Types::SectionType, type: :graphql do
  describe 'fields' do
    it 'returns fields of given section' do
      nested_fields = ['lessons']
      fields = described_class.fields.keys.excluding(nested_fields)
      section = create(:section)
      query = <<-GQL
        {
          course(slug: "#{section.course.slug}") {
            sections {
              #{fields.join("\n")}
              #{nested_fields.map { |field| "#{field} {id}" }.join("\n")}
            }
          }
        }
      GQL
      section_data = fields.excluding(nested_fields).each_with_object({}) do |field, hash|
        hash[field] = section.send(field.underscore.to_sym)
      end.merge!(Hash[nested_fields.map { |field| [field, []] }])
      expect(response_data_of_gql_execution(query)['course']['sections'].first)
        .to eq(graphql_response_data_format(section_data))
    end
  end
end
