class CourseSerializer
  include JSONAPI::Serializer
  attributes :name, :teacher_name, :description

  attribute :sections do |course|
    course.sections.order(position: :asc).map { |section| SectionSerializer.new(section).serializable_hash }
  end
end
