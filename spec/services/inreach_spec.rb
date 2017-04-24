require "rails_helper"

RSpec.describe InreachService do
  context "methods" do
    describe ".latest_coordinates" do
      it "returns the latest coordinates of the GPS" do
        VCR.use_cassette("inreach") do
          result = InreachService.latest_coordinates

          expect(result.keys).to match_array [:lat, :lng]
        end
      end
    end
  end
end

