require 'rails_helper'

RSpec.describe CurrentLocationPin, type: :model do
  context "validations" do
    it { should validate_presence_of(:lat) }
    it { should validate_presence_of(:lng) }
  end

  describe ".by_date" do
    it "returns all pins by date ascending" do
      pin1 = create(:current_location_pin, created_at: Time.now.utc - 1.day)
      pin2 = create(:current_location_pin, created_at: Time.now.utc)
      pin3 = create(:current_location_pin, created_at: Time.now.utc + 1.day)

      ids = described_class.by_date.pluck(:id)
      expect(ids).to eq [pin1.id, pin2.id, pin3.id]
      expect(ids.count).to eq described_class.count
    end

    it "returns all pins by date, most recent first, even if out of order" do
      pin1 = create(:current_location_pin, created_at: Time.now.utc)
      pin2 = create(:current_location_pin, created_at: Time.now.utc - 1.day)
      pin3 = create(:current_location_pin, created_at: Time.now.utc + 1.day)

      ids = described_class.by_date.pluck(:id)
      expect(ids).to eq [pin2.id, pin1.id, pin3.id]
    end
  end
end
