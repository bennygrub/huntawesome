class Group < ActiveRecord::Base
  has_many :group_users
  has_many :users, through: :group_users
  has_many :completed_tasks
  has_many :tasks, through: :completed_tasks
  has_many :invites
end
