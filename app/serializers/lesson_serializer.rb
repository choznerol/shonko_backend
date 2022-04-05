class LessonSerializer
  include JSONAPI::Serializer
  attributes :name, :description, :content, :position
end
