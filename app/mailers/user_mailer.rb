class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    @url = "this is where url will go"
    mail(to: user.email, subject: "Welcome to the Savvy Madam!")
  end
end
