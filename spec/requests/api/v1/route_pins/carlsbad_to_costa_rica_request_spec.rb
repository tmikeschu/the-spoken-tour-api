require "rails_helper"

RSpec.describe "Carlsbad to Costa Rica endpoint", type: :request do
  before do
    create_list(:route_pin, 3, route_leg: 1)
    create_list(:route_pin, 2, route_leg: 0)
  end

  it "returns a collection of lat and lng points" do
    get api_v1_route_pins_carlsbad_to_costa_rica_path, params: { api_key: ENV["api_key"] }

    expect(response).to be_success

    points   = JSON.parse(response.body, symbolize_names: true)
    point    = points.first
    db_point = RoutePin.first

    expect(points.count).to eq 3

    expect(point).to have_key(:location)
    expect(point[:location]).to have_key(:lat)
    expect(point[:location]).to have_key(:lng)
    expect(point[:location][:lat]).to eq db_point.lat.to_s
    expect(point[:location][:lng]).to eq db_point.lng.to_s
  end
end
