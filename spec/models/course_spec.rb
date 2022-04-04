require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'associations' do
    it { should have_many(:sections).dependent(:destroy) }
    it { should have_many(:lessons) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:teacher_name) }
  end

  describe 'nested_attributes' do
    it { should accept_nested_attributes_for(:sections).allow_destroy(true) }
  end

  describe '#name_and_date_of_today' do
    it 'returns formatted string composed by name and created_date' do
      travel_to(Date.new(2022, 4, 2))
      course = build(:course, name: 'test')
      expect(course.name_and_date_of_today).to eq('test-2022-04-02')
      travel_back
    end
  end
end
