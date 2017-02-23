require "rails_helper"

RSpec.describe RoutePinSerializer do
  it "returns a hash with lat and lng" do
    pin        = create(:route_pin)
    serializer = RoutePinSerializer.new(pin)
    json_pin   = JSON.parse(ActiveModelSerializers::Adapter.create(serializer).to_json)
    expect(json_pin["location"]["lat"]).to eq pin.lat.to_s
    expect(json_pin["location"]["lng"]).to eq pin.lng.to_s
  end
end
