require 'rails_helper'

describe LessonSerializer do
  describe '#serializable_hash' do
    it 'returns data containing attributes of given lesson' do
      lesson = create(:lesson)
      serializer = described_class.new(lesson)
      expect(serializer.serializable_hash[:data][:attributes]).to eq(
        name: lesson.name, description: lesson.description, content: lesson.content, position: lesson.position
      )
    end
  end
end
