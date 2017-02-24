require 'rails_helper'

RSpec.describe RoutePin, type: :model do
  context "validations" do
    it { should validate_presence_of(:lat) }
    it { should validate_presence_of(:lng) }
  end

  context "#route_leg" do
    let(:route_legs) { %w(
                          denver_to_carlsbad
                          carlsbad_to_costa_rica
                          costa_rica_to_darien_gap
                          darien_gap_to_cabo_froward
                         ) }

    it 'has the right index' do
      route_legs.each_with_index do |leg, index|
        expect(described_class.route_legs[leg]).to eq index
      end
    end
  end
end
