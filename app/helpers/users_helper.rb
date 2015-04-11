module UsersHelper

  def level
    Level.find(@user.level)
  end

  def earned_level_points
    Task.sum(:points, conditions: {id: @user.completed_tasks.pluck(:task_id), level: @user.level})
  end

  def percentage_of_level_complete
    (earned_level_points*1.00/level.points)*100
  end
end
