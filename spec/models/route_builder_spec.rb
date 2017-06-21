require "rails_helper"

RSpec.describe RouteBuilder do
  let(:old_location_data) { {
    date: Date.today,
    location: { lat: 70, lng: 70 }
  }}

  let(:new_location_data) {{
    date: Date.today,
    location: { lat: 90, lng: 90 }
  }}

  let(:bad_location_data) {{
    date: Date.today,
    location: { lat: 0, lng: 0 }
  }}

  describe ".add_or_update_todays_location" do
    it "adds a record if the day is not represented" do
      expect(CurrentLocationPin.count).to eq 0
      described_class.add_or_update_todays_location(old_location_data)
      expect(CurrentLocationPin.count).to eq 1
    end

    it "does not add a record if the day is represented" do
      described_class.add_or_update_todays_location(old_location_data)
      expect(CurrentLocationPin.count).to eq 1

      described_class.add_or_update_todays_location(new_location_data)
      expect(CurrentLocationPin.count).to eq 1
    end

    it "does update the data for a day" do
      pin = described_class.add_or_update_todays_location(old_location_data)
      expect(pin.lat.to_i).to eq 70
      expect(pin.lng.to_i).to eq 70

      described_class.add_or_update_todays_location(new_location_data)
      pin.reload
      expect(pin.lat.to_i).to eq 90
      expect(pin.lng.to_i).to eq 90
      expect(CurrentLocationPin.count).to eq 1
    end

    it "does not create if lat and long are 0" do
      pin = described_class.add_or_update_todays_location(bad_location_data)
      expect(pin).to be nil
      expect(CurrentLocationPin.count).to eq 0
    end

    it "does not update if lat and long are 0" do
      pin = described_class.add_or_update_todays_location(old_location_data)
      expect(pin.lat.to_i).to eq 70
      expect(pin.lng.to_i).to eq 70

      described_class.add_or_update_todays_location(bad_location_data)
      pin.reload
      expect(pin.lat.to_i).to eq 70
      expect(pin.lng.to_i).to eq 70
    end
  end

  describe "#create_or_update" do
    it "updates an existing current location pin for the day" do
      location = create(:current_location_pin, lat: 20, lng: 20)
      subject.create_or_update.call(location, { lat: 40, lng: 50 })
      expect(location.created_at).to_not eq location.updated_at
      expect(location.lat).to eq 40
      expect(location.lng).to eq 50
    end

    it "creates a new current location pin if existing pin doesn't exist" do
      expect(CurrentLocationPin.count).to eq 0
      location = subject.create_or_update.call(nil, {lat: 10, lng: 20})
      expect(CurrentLocationPin.count).to eq 1
      expect(location.lat).to eq 10
      expect(location.lng).to eq 20
    end
  end
end

