class ContactJob < ApplicationJob
  queue_as :default

  def perform(message_data)
    @message_data = message_data
    ContactMailer.contact(@message_data).deliver_later
  end
end
