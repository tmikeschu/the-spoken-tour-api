class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(pin)
		@pin = pin
    SuggestionMailer.suggestion(@pin).deliver_later
  end
end
