require "rails_helper"

RSpec.describe RouteBuilder do
  describe ".add_or_update_todays_location" do
    it "adds a record if the day is not represented" do
      location_data = {
        date: Date.today,
        location: {
          lat: 70,
          lng: 70
        }
      }

      expect(CurrentLocationPin.count).to eq 0
      described_class.add_or_update_todays_location(location_data)
      expect(CurrentLocationPin.count).to eq 1
    end
    
    it "does not add a record if the day is represented" do
      old_location_data = {
        date: Date.today,
        location: {
          lat: 70,
          lng: 70
        }
      }

      new_location_data = {
        date: Date.today,
        location: {
          lat: 90,
          lng: 90
        }
      }

      described_class.add_or_update_todays_location(old_location_data)
      expect(CurrentLocationPin.count).to eq 1

      described_class.add_or_update_todays_location(new_location_data)
      expect(CurrentLocationPin.count).to eq 1
    end

    it "does update the data for a day" do
      old_location_data = {
        date: Date.today,
        location: {
          lat: 70,
          lng: 70
        }
      }

      new_location_data = {
        date: Date.today,
        location: {
          lat: 90,
          lng: 90
        }
      }

      described_class.add_or_update_todays_location(old_location_data)
      expect(CurrentLocationPin.first.lat.to_i).to eq 70
      expect(CurrentLocationPin.first.lng.to_i).to eq 70

      described_class.add_or_update_todays_location(new_location_data)
      expect(CurrentLocationPin.first.lat.to_i).to eq 90
      expect(CurrentLocationPin.first.lng.to_i).to eq 90
    end
  end
end
