require "rails_helper"

RSpec.describe SendEmailJob, :type => :job do
  include ActiveJob::TestHelper

  let(:pin) { FactoryBot.create(:suggestion_pin) }
  subject(:job) { described_class.perform_later(pin) }

  before do
    ActiveJob::Base.queue_adapter = :test
  end

  describe "#perform_later" do
    it "sets up a mailer job" do
      expect { job }
        .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
    end

    it "calls a mailer" do
      allow(SuggestionMailer)
        .to receive(:suggestion).and_return(SuggestionMailer.suggestion(pin))
      expect(SuggestionMailer).to receive(:suggestion).with(pin)
      perform_enqueued_jobs { job }
    end
  end
end

