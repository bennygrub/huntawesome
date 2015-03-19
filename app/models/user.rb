class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessor :group_name
  validates_presence_of :name
  after_create :group_user_association
  has_many :group_users
  has_many :groups, through: :group_users
  has_many :completed_tasks
  has_many :tasks, through: :completed_tasks
  has_many :task_documentations
  def group_user_association
    if Invite.where( email == self.email).count > 1
      invite = Invite.where( email == self.email).first
      group = Group.find(invite.group_id)
      invite.destroy
    elsif self.group_name.blank?
      group = Group.create(name: self.name)
    else
      group = Group.create(name: self.group_name)
    end
    @group_user = GroupUser.create(user_id: self.id, group_id: group.id)
    CompletedTask.create(user_id: self.id, group_id: group.id, task_id: 1)
    CompletedTask.create(user_id: self.id, group_id: group.id, task_id: 2)
  end

end
