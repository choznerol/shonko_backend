require 'rails_helper'

describe CourseSerializer do
  describe '#serializable_hash' do
    it 'returns data containing attributes of given course' do
      course = create(:course)
      serializer = described_class.new(course)
      expect(serializer.serializable_hash[:data][:attributes]).to eq(
        name: course.name, teacher_name: course.teacher_name, description: course.description,
        sections: []
      )
    end
  end
end
