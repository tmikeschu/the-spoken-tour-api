class SuggestionMailer < ApplicationMailer
  default from: 'tmikeschutte@gmail.com'

  def suggestion(pin)
    @pin = pin
    mail(to: "thespokentour@gmail.com", subject: "New map suggestion!")
  end
end
