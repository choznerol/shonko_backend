# frozen_string_literal: true

module Types
  class CourseType < Types::BaseObject
    field :id, Integer, null: false
    field :name, String, null: false
    field :teacher_name, String, null: false
    field :description, String
    field :slug, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :sections, [Types::SectionType]

    def sections
      object.sections.order(position: :asc)
    end
  end
end
