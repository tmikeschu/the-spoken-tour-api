require "rails_helper"

RSpec.describe "Instagram API filter", type: :request do
  before do
    allow_any_instance_of(ApplicationController).to receive(:authorized?).and_return(true)
  end

  describe "GET /api/v1/instagram_photos" do
    it "returns a list of all photos from The Spoken Tour account" do
      VCR.use_cassette("instagram") do
        get api_v1_instagram_photos_path

        expect(response).to be_success

        photos = JSON.parse(response.body, symbolize_names: true)
        photo  = photos.first

        expect(photo.keys).to match_array([:caption, :image, :link])
      end
    end
  end
end
