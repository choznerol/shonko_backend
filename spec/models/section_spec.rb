require 'rails_helper'

RSpec.describe Section, type: :model do
  describe 'associations' do
    it { should belong_to(:course) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:position) }

    describe 'validates_uniqueness_of :position' do
      subject { build(:section) }
      it { should validate_uniqueness_of(:position).scoped_to(:course_id) }
    end

    describe 'validates_numericality_of :position' do
      it do
        skip
        # FIXME: Seems to be an issue with acts_as_list_gem
        # https://github.com/brendon/acts_as_list/issues/269
        # it converts negative value of position to zero automatically
        # So we cannot perform simple one-liner with since it would fail.
        # section = build(:section, position: -1)
        # section.position
        # expect(section.valid?).to be_falsey
        # expect(section).to validate_numericality_of(:position).is_greater_than_or_equal_to(0)
      end
    end


  end
end
