class Lesson < ApplicationRecord
  belongs_to :section
  acts_as_list scope: :section, top_of_list: 0
  validates_presence_of :name, :content
end
