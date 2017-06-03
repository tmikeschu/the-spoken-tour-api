class ContactMailer < ApplicationMailer
  default from: 'tmikeschutte@gmail.com'

  def contact(message)
    @message = message
    mail(to: "thespokentour@gmail.com", from: @message[:email], subject: "New message!")
  end
end
