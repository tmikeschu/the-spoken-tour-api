require "rails_helper"

RSpec.describe SuggestionMailer, type: :mailer do
  describe ".message" do
    let(:pin) { create(:suggestion_pin) }
    let(:message) { SuggestionMailer.suggestion(pin) }

    it "sends an info message about the suggestion" do
      assert_emails 1 do
        message.deliver_now
      end

      expect(message.to).to eq ["thespokentour@gmail.com"]
      expect(message.subject).to eq "New map suggestion!" 
      expect(message.to_s).to include "Hey Spokers!" 
      expect(message.to_s).to include pin.message
      expect(message.to_s).to include pin.lat.to_s
      expect(message.to_s).to include pin.lng.to_s
      expect(message.to_s).to include pin.label
      expect(message.to_s).to include pin.description
      expect(message.to_s).to include pin.category
    end
  end
end
