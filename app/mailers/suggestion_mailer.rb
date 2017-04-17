class SuggestionMailer < ApplicationMailer
  default from: 'no-reply@mikeschutte.com'

  def suggestion(pin)
    @pin = pin
    mail(to: "thespokentour@gmail.com", subject: "New map suggestion!")
  end
end
