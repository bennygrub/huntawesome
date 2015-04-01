class CompletedTask < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  belongs_to :task
  after_save :update_user

  def update_user
    user_obj = User.find(self.user_id)
    user_obj.level == 1 || user_obj.level == 4 ? points = 1500 : points = 2000
    user_obj.update_level! if user_obj.tasks.where(level: user_obj.level).sum(:points) >= points
    user_obj.update_points(self.task.points)
  end
end
