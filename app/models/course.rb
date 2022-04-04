class Course < ApplicationRecord
  extend ::FriendlyId
  friendly_id :name_and_date_of_today, use: :slugged
  has_many :sections, dependent: :destroy
  has_many :lessons, through: :sections
  validates_presence_of :name, :teacher_name
  accepts_nested_attributes_for :sections, allow_destroy: true

  def name_and_date_of_today
    "#{name}-#{Date.today.strftime('%F')}"
  end
end
