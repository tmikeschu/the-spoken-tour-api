require "rails_helper"

RSpec.describe InstagramService do
  context "methods" do
    describe ".get_photos" do
      it "returns an array of hashes with photo info" do
        VCR.use_cassette("instagram") do
          result = InstagramService.get_photos

          expect(result).to be_an(Array)
          result.each do |photo|
            expect(photo.keys).to match_array([:caption, :image, :link])
          end
        end
      end
    end
  end
end

