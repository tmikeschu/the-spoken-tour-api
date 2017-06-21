require "rails_helper"

RSpec.describe InreachService do
  context "methods" do
    describe ".latest_coordinates" do
      it "returns the latest coordinates of the GPS" do
        VCR.use_cassette("inreach") do
          result = described_class.latest_coordinates

          expect(result.keys).to match_array [:date, :location]
          expect(result[:location].keys).to match_array [:lat, :lng]
        end
      end
    end

    describe "#latest_coordinates" do
      it "returns the latest coordinates of the GPS" do
        VCR.use_cassette("inreach") do
          result = subject.latest_coordinates

          expect(result.keys).to match_array [:date, :location]
          expect(result[:location].keys).to match_array [:lat, :lng]
        end
      end
    end

    describe "#latitude" do
      it "returns the latitude for good data" do
        fake_response = "<Data name='Latitude'><value>10<value></Data>"
        expect(subject.latitude(fake_response)).to eq 10
      end

      it "returns zero for bad data" do
        fake_response = ""
        expect(subject.latitude(fake_response)).to eq 0
      end
    end

    describe "#longitude" do
      it "returns the longitude for good data" do
        fake_response = "<Data name='Longitude'><value>20<value></Data>"
        expect(subject.longitude(fake_response)).to eq 20
      end

      it "returns zero for bad data" do
        fake_response = ""
        expect(subject.longitude(fake_response)).to eq 0
      end
    end

    describe "#date" do
      it "returns the date for good data" do
        fake_response = "<Data name='Time'><value>4/23/2017 5:17:15 PM</value></Data>"
        expect(subject.date(fake_response)).to eq "4/23/2017 5:17:15 PM"
      end

      it "returns an empty string for bad data" do
        fake_response = ""
        expect(subject.date(fake_response)).to eq ""
      end
    end
  end
end

