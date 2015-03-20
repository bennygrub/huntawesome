class Invite < ActiveRecord::Base
  belongs_to :group
  after_create :send_invite

  def send_invite
    InviteMailer.invite_group(self.email, self.group_id, self.user_id).deliver
  end
end
