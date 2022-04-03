class Section < ApplicationRecord
  belongs_to :course
  acts_as_list scope: :course, top_of_list: 0
  validates_presence_of :name, :position
  validates_uniqueness_of :position, scope: :course_id
  # FIXME: Seems like an issue of acts_as_list_gem
  # it converts negative value of position to zero automatically
  # https://github.com/brendon/acts_as_list/issues/269
  # validates_numericality_of :position, greater_than_or_equal_to: 0
end
