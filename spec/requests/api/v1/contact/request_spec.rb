require "rails_helper"

RSpec.describe "Contact API" do
  before do
    allow_any_instance_of(ApplicationController)
      .to receive(:authorized?).and_return(true)
  end

  let(:contact) { 
    { contact: { name: "Tommy", email: "tyler@michael.com", message: "Hello!" } }
  }

  describe "POST /api/v1/contact" do
    it "returns a 201 if successful" do
      post api_v1_contact_path, params: contact

      expect(response).to be_successful
      expect(response.status).to eq 201
      expect(response.body).to eq ({message: "Message Sent!"}).to_json
    end

    it "calls the ContactMailer" do
      allow(ContactJob).to receive(:set).and_return(ContactJob)
      expect(ContactJob).to receive(:perform_later).with(contact[:contact])
      post api_v1_contact_path, params: contact
    end

    describe "Sad paths" do
      it "returns a 400 if data is missing" do
        post api_v1_contact_path, params: { contact: { name: "mike", email: "m@m.m" } }

        expect(response.status).to eq 400
        expect(response.body).to eq ({message: "Missing data"}).to_json
      end

      it "does not call the ContactMailer" do
        allow(ContactJob).to receive(:set).and_return(ContactJob)
        expect(ContactJob).to_not receive(:perform_later).with(contact[:contact])
        post api_v1_contact_path, params: { contact: { name: "mike", email: "m@m.m" } }
      end
    end
  end
end
