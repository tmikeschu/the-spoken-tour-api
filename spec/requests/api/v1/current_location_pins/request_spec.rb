require "rails_helper"

RSpec.describe "Current Location Pins API" do
  before do
    allow_any_instance_of(ApplicationController).to receive(:authorized?).and_return(true)
  end

  describe "GET /api/v1/current_location" do
    it "returns the latest location" do
      VCR.use_cassette("inreach") do
        get api_v1_current_location_path

        expect(response).to be_success

        json_pin      = JSON.parse(response.body, symbolize_names: true)
        expected_keys = [:location, :date, :id]

        expect(json_pin.keys).to match_array(expected_keys)
      end
    end

    it "adds a location to the database" do
      VCR.use_cassette("inreach") do
        expect(CurrentLocationPin.count).to eq 0

        get api_v1_current_location_path
        expect(CurrentLocationPin.count).to eq 1
      end
    end

    it "does not add a db record for the same day" do
      VCR.use_cassette("inreach", allow_playback_repeats: true) do
        get api_v1_current_location_path
        expect(CurrentLocationPin.count).to eq 1

        get api_v1_current_location_path
        expect(CurrentLocationPin.count).to eq 1
      end
    end

    it "only makes a new pin if the coordinates are new" do
      VCR.use_cassette("inreach", allow_playback_repeats: true) do
        get api_v1_current_location_path
        expect(CurrentLocationPin.count).to eq 1

        get api_v1_current_location_path
        expect(CurrentLocationPin.count).to eq 1
      end
    end
  end

  describe "POST /api/v1/current_location" do
    it "posts a new current location" do
      create_list(:current_location_pin, 5)

      pin_params = { lat: 39.1234, lng: -135.20995, }

      post api_v1_current_location_path, params: { pin: pin_params }

      expect(response).to be_success
      expect(response.status).to eq 201

      json_pin      = JSON.parse(response.body, symbolize_names: true)
      db_pin        = CurrentLocationPin.last
      latest_update = CurrentLocationPin.maximum(:updated_at)
      latest_pin    = CurrentLocationPin.where(updated_at: latest_update).first
      expected_keys = [:id, :location, :date]

      expect(db_pin).to eq(latest_pin)
      expect(json_pin[:id]).to eq db_pin.id
      expect(json_pin.keys).to match_array(expected_keys)
    end
  end

  describe "GET /api/v1/actual_path" do
    it "returns a list of lat, lng, and date for the actual route" do
      create_list(:current_location_pin, 5)

      get api_v1_actual_path_path

      expect(response).to be_success

      points = JSON.parse(response.body, symbolize_names: true)
      expected_keys = [:location, :date, :id]

      points.each do |point|
        expect(point.keys).to match_array(expected_keys)
      end
    end
  end
end

