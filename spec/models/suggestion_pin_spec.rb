require 'rails_helper'

RSpec.describe SuggestionPin, type: :model do
  context "validations" do
    it { should validate_presence_of(:lat) }
    it { should validate_presence_of(:lng) }
    it { should validate_presence_of(:label) }
    it { should validate_presence_of(:description) }
  end

  context "#category" do
    let(:categories) { %w(
                          stay
                          checkout
                          avoid
                          bike_shop
                          other
                         ) }

    it 'has the right index' do
      categories.each_with_index do |category, index|
        expect(described_class.categories[category]).to eq index
      end
    end
  end
end
