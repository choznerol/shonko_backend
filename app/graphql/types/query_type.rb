module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :courses, type: [CourseType], description: 'Returns data of courses'
    field :course, type: CourseType, description: 'Returns data of courses' do
      argument :slug, String
    end

    def courses
      Course.includes(sections: :lessons).all
    end

    def course(slug:)
      Course.find_by!(slug: slug)
    end
  end
end
