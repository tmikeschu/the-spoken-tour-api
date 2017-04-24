# Preview all emails at http://localhost:3000/rails/mailers/suggestion_mailer
class SuggestionMailerPreview < ActionMailer::Preview
  def suggestion_preview
    pin = FactoryGirl.create(:suggestion_pin)
    SuggestionMailer.suggestion(pin)
  end
end
