# Preview all emails at http://localhost:3000/rails/mailers/contact
class ContactPreview < ActionMailer::Preview
  def send_preview
    message = {}
    ContactMailer.send(message)
  end
end
