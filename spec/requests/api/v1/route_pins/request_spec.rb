require "rails_helper"

RSpec.describe "Route Pins API", type: :request do
  let!(:points) { create_list(:route_pin, 5) }

  it "returns a collection of lat and lng points" do
    get api_v1_route_pins_path, params: { api_key: ENV["api_key"] }

    expect(response).to be_success

    points   = JSON.parse(response.body, symbolize_names: true)
    point    = points.first
    db_point = RoutePin.first

    expect(points.count).to eq 5

    expect(point).to have_key(:location)
    expect(point[:location]).to have_key(:lat)
    expect(point[:location]).to have_key(:lng)
    expect(point[:location][:lat]).to eq db_point.lat.to_s
    expect(point[:location][:lng]).to eq db_point.lng.to_s
  end

  it "returns a 401 if api key is missing" do
    get api_v1_route_pins_path

    expect(response.status).to eq 401
  end

  it "returns a 401 if api key is incorrect" do
    get api_v1_route_pins_path, params: { api_key: "h4a12cba-b75d-486c-ae7e-196;lk2f4778" }

    expect(response.status).to eq 401
  end
end
