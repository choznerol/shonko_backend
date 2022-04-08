class SectionSerializer
  include JSONAPI::Serializer
  attributes :name, :position

  attribute :lessons do |section|
    section.lessons.map { |lesson| LessonSerializer.new(lesson).serializable_hash }
  end
end
