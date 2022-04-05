# frozen_string_literal: true

module Types
  class SectionType < Types::BaseObject
    field :id, Integer, null: false
    field :name, String, null: false
    field :position, Integer, null: false
    field :course_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :lessons, [Types::LessonType]

    def lessons
      object.lessons.order(position: :asc)
    end
  end
end
