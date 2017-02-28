require "rails_helper"

RSpec.describe "Suggestion Pins API" do
  before do
    allow_any_instance_of(ApplicationController).to receive(:authorized?).and_return(true)
  end

  it "returns an array of suggestions" do
    create_list(:suggestion_pin, 5)

    get api_v1_suggestion_pins_path

    expect(response).to be_success

    pins = JSON.parse(response.body, symbolize_names: true)
    pin  = pins.first

    expect(pins.count).to eq 5

    expected_keys = [
      :id, :category, :label, :location, :description, :message
    ]
    expect(pin.keys).to match_array(expected_keys)
  end

  it "posts a new suggestion pin" do
    pin_params = {
      category: 1,
      description: "This is an awesome restaurant",
      message: "You guys should talk to my friend there",
      lat: 39.1234,
      lng: -135.20995,
      label: "Hot restaurant"
    }
    post_params = {
      pin: pin_params
    }

    post api_v1_suggestion_pins_path, params: post_params

    expect(response).to be_success
    expect(response.status).to eq 201

    json_pin = JSON.parse(response.body, symbolize_names: true)
    db_pin   = SuggestionPin.last
    expect(json_pin[:id]).to eq db_pin.id

    expected_keys = [
      :id, :category, :label, :location, :description, :message
    ]
    expect(json_pin.keys).to match_array(expected_keys)
  end

  it "shows a single pin's information" do
    pin = create(:suggestion_pin)

    get api_v1_suggestion_pin_path(pin)

    expect(response).to be_success

    json_pin = JSON.parse(response.body, symbolize_names: true)
    db_pin   = SuggestionPin.last
    expect(json_pin[:id]).to eq db_pin.id

    expected_keys = [
      :id, :category, :label, :location, :description, :message
    ]
    expect(json_pin.keys).to match_array(expected_keys)
  end
end
