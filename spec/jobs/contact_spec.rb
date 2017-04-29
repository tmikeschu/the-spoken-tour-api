require "rails_helper"

RSpec.describe ContactJob, :type => :job do
  include ActiveJob::TestHelper

  let(:contact) { { name: "Tommy", email: "tyler@michael.com", message: "Hello!" } }
  subject(:job) { described_class.perform_later(contact) }

  before do
    ActiveJob::Base.queue_adapter = :test
  end

  describe "#perform_later" do
    it "sets up a mailer job" do
      expect { job }
        .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
    end

    it "calls a mailer" do
      allow(ContactMailer)
        .to receive(:contact).and_return(ContactMailer.contact(contact))
      expect(ContactMailer).to receive(:contact).with(contact)
      perform_enqueued_jobs { job }
    end
  end
end

