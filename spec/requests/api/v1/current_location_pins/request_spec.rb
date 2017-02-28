require "rails_helper"

RSpec.describe "Current Location Pins API" do
  before do
    allow_any_instance_of(ApplicationController).to receive(:authorized?).and_return(true)
  end

  it "returns the latest location" do
    create_list(:current_location_pin, 5)
    latest = create(:current_location_pin)

    get api_v1_current_location_path

    expect(response).to be_success

    json_pin      = JSON.parse(response.body, symbolize_names: true)
    latest_update = CurrentLocationPin.maximum(:updated_at)
    latest_pin    = CurrentLocationPin.where(updated_at: latest_update).first
    expected_keys = [:id, :location, :date]

    expect(json_pin.keys).to match_array(expected_keys)
    expect(json_pin[:id]).to eq(latest_pin.id)
  end

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

