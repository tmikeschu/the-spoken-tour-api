require "rails_helper"

RSpec.describe "Instagram API filter", type: :request do
  it "returns a list of all photos from The Spoken Tour account" do
    VCR.use_cassette("instagram") do
      get api_v1_instagram_photos_path, params: { api_key: ENV["api_key"] }

      expect(response).to be_success

      photos = JSON.parse(response.body, symbolize_names: true)
      photo  = photos.first

      expect(photos.count).to eq 1

      expect(photo.keys).to match_array([:caption, :image, :link])
    end
  end
end
