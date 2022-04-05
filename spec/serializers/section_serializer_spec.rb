require 'rails_helper'

describe SectionSerializer do
  describe '#serializable_hash' do
    it 'returns data containing attributes of given section' do
      section = create(:section)
      serializer = described_class.new(section)
      expect(serializer.serializable_hash[:data][:attributes]).to eq(
        name: section.name, position: section.position, lessons: []
      )
    end
  end
end
