class UserMailer < ActionMailer::Base
  default from: "Hunt Awesome <yourfriends@huntawesome.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @greeting = "Hi"
    mail(to: "#{@name} <#{@email}>", subject: "#{@request.contact_name} submitted a new event request")
  end

  def new_user(user)
    @user = User.find(user)
    mail(to: "blgruber@gmail.com", subject: "#{@user.name} signed up")
  end
end
