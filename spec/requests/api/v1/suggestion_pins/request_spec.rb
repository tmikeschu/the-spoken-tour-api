require "rails_helper"

RSpec.describe "Suggestion Pins API" do
  before do
    allow_any_instance_of(ApplicationController).to receive(:authorized?).and_return(true)
  end

  describe "GET /api/v1/suggestion_pins" do
    it "returns an array of suggestions" do
      create_list(:suggestion_pin, 5)

      get api_v1_suggestion_pins_path

      expect(response).to be_success

      pins = JSON.parse(response.body, symbolize_names: true)
      pin  = pins.first

      expect(pins.count).to eq 5

      expected_keys = [
        :id, :category, :label, :location, :description
      ]
      expect(pin.keys).to match_array(expected_keys)
    end
  end

  describe "POST /api/v1/suggestion_pins" do
    it "posts a new suggestion pin" do
      pin_params = {
        pin: {
          category: 1,
          description: "This is an awesome restaurant",
          message: "You guys should talk to my friend there",
          lat: 39.1234,
          lng: -135.20995,
          label: "Hot restaurant",
          name: "Mike",
          email: "mike@schutte.com"
        }
      }

      post api_v1_suggestion_pins_path, params: pin_params

      expect(response).to be_success
      expect(response.status).to eq 201

      json_pin = JSON.parse(response.body, symbolize_names: true)
      db_pin   = SuggestionPin.last
      expect(json_pin[:id]).to eq db_pin.id

      expected_keys = [
        :id, :category, :label, :location, :description
      ]
      expect(json_pin.keys).to match_array(expected_keys)

      pin_params[:pin].each do |attr, value|
        unless attr == :category
          expect(db_pin.send(attr)).to eq value
        end
      end
    end
  end

  describe "GET /api/v1/suggestion_pins/:id" do
    it "shows a single pin's information" do
      pin = create(:suggestion_pin)

      get api_v1_suggestion_pin_path(pin)

      expect(response).to be_success

      json_pin = JSON.parse(response.body, symbolize_names: true)
      db_pin   = SuggestionPin.last
      expect(json_pin[:id]).to eq db_pin.id

      expected_keys = [
        :id, :category, :label, :location, :description
      ]
      expect(json_pin.keys).to match_array(expected_keys)
    end
  end
end
