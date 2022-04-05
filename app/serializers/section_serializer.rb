class SectionSerializer
  include JSONAPI::Serializer
  attributes :name, :position

  attribute :lessons do |section|
    section.lessons.order(position: :asc).map { |lesson| LessonSerializer.new(lesson).serializable_hash }
  end
end
