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

  describe "default scope" do
    before do
      create(:current_location_pin, lat: 0, lng: 0)
      create(:current_location_pin)
    end

    it "filters out points with 0, 0 for lat and lng" do
      expect(CurrentLocationPin.count).to eq 1
    end

    it "can be unscoped" do
      expect(CurrentLocationPin.unscoped.count).to eq 2
    end
  end

  describe ".for_date" do
    it "returns pin for the current date if pin exists" do
      pin = create(:current_location_pin)
      expect(CurrentLocationPin.for_date(pin.created_at)).to eq pin
    end

    it "returns nil if pin does not exist" do
      expect(CurrentLocationPin.for_date(Time.now)).to be nil
    end
  end

  describe ".latest" do
    it "returns most recent pin by date" do
      create(:current_location_pin, created_at: Time.now.utc - 1.day)
      create(:current_location_pin, created_at: Time.now.utc)
      pin3 = create(:current_location_pin, created_at: Time.now.utc + 1.day)
      create(:current_location_pin, created_at: Time.now.utc + 1.day, lat: 0, lng: 0)

      expect(CurrentLocationPin.latest).to eq pin3
    end
  end
end
