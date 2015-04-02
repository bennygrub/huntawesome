class ReminderMailer < ActionMailer::Base
  default from: "Hunt Awesome <reminder@huntawesome.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reminder_mailer.weekly.subject
  #
  def weekly(user)
    @user = User.find(user)
    @points_away = Level.find(@user.level).points - @user.points
    mail(to: "#{@user.name} <#{@user.email}>", subject: "Its Your Weekly Reminder to be Awesome")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reminder_mailer.suggested.subject
  #
  def suggested(user)
    @user = User.find(user)
    mail(to: "#{@user.name} <#{@user.email}>", subject: "#{@user.name} - Its time for Awesome")
  end
end
