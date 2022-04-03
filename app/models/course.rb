class Course < ApplicationRecord
  extend ::FriendlyId
  friendly_id :name_and_date_of_today, use: :slugged
  validates_presence_of :name, :teacher_name

  def name_and_date_of_today
    "#{name}-#{Date.today.strftime('%F')}"
  end
end
