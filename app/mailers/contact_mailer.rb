class ContactMailer < ActionMailer::Base
  ############################################
  #consult this for setting up with heroku:  #
  #https://devcenter.heroku.com/articles/smtp#
  ############################################
  default from: "from@example.com"

  def contact_mail(contact)
    @name = contact.name
    @body = contact.body
    email = contact.email
    subject = contact.subject
    mail(to: email, subject: subject) 
  end
end
