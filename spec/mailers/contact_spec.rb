require "rails_helper"

RSpec.describe ContactMailer, type: :mailer do
  describe ".contact" do
    let(:contact_data) { 
      { name: "Tyler", email: "tommy@crosby.com", message: "Hello!" }
    } 

    let(:message) { ContactMailer.contact(contact_data) }

    it "sends an info message about the suggestion" do
      assert_emails 1 do
        message.deliver_now
      end

      expect(message.to).to eq ["thespokentour@gmail.com"]
      expect(message.from).to eq ["tommy@crosby.com"]
      expect(message.subject).to eq "New message!" 
      expect(message.to_s).to include "Hey Spokers!" 
      expect(message.to_s).to include "From: Tyler" 
      expect(message.to_s).to include "At: tommy@crosby.com" 
      expect(message.to_s).to include "What they said: Hello!" 
    end
  end
end
