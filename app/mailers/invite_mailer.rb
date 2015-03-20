class InviteMailer < ActionMailer::Base
  default from: "Hunt Awesome <invites@huntawesome.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invite_mailer.invite_group.subject
  #
  def invite_group(email, group_id, user)
    @user = User.find(user)
    @email = email
    @group = Group.find(group_id)
    mail(to: "#{@email}", subject: "#{@user.name} - Invited You to Join Their Scavenger Hunt Awesome Group")
  end
end
