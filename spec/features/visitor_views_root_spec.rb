require "rails_helper"

RSpec.describe do
  context "visitor" do
    describe "visits root page" do
      scenario "and sees information about the api endpoints" do
        visit root_path

        expect(page).to have_content "Welcome to the API for The Spoken Tour!"
        expect(page).to have_content "Endpoints:"

        Rails.application.routes.routes.each do |route|
          if route.path.spec.to_s.starts_with?("/api")
            verb = route.verb.to_s.gsub("$)", "").gsub("(?-mix:^", "")
            path = route.path.spec.to_s.gsub("(.:format)", "")

            expect(page).to have_content "#{verb} #{path}"
          end
        end
      end
    end
  end
end
