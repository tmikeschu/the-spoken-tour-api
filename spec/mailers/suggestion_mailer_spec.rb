require "rails_helper"

RSpec.describe SuggestionMailer, type: :mailer do
  describe ".message" do
    let(:pin) { create(:suggestion_pin) }
    let(:message) { SuggestionMailer.suggestion(pin).deliver }

    it "sends an info message about the suggestion" do
      expect(message.to).to eq ["thespokentour@gmail.com"]
      expect(message.subject).to eq "New map suggestion!" 
      expect(message.body.raw_source).to include "Hey Spokers!" 
      expect(message.body.raw_source).to include pin.message
      expect(message.body.raw_source).to include pin.lat.to_s
      expect(message.body.raw_source).to include pin.lng.to_s
      expect(message.body.raw_source).to include pin.label
      expect(message.body.raw_source).to include pin.description
      expect(message.body.raw_source).to include pin.category
    end
  end
end
