require 'rails_helper'

RSpec.describe Types::LessonType, type: :graphql do
  describe 'fields' do
    it 'returns fields of given lesson' do
      fields = described_class.fields.keys
      lesson = create(:lesson)
      query = <<-GQL
        {
          course(slug: "#{lesson.section.course.slug}") {
            sections {
              lessons {
                #{fields.join("\n")}
              }
            }
          }
        }
      GQL
      lesson_data = fields.each_with_object({}) do |field, hash|
        hash[field] = lesson.send(field.underscore.to_sym)
      end
      expect(response_data_of_gql_execution(query)['course']['sections'].first['lessons'].first)
        .to eq(graphql_response_data_format(lesson_data))
    end
  end
end
