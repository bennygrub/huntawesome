task :point_level_update => :environment do
  User.all.each do |user|
    #task_ids = user.completed_tasks.map{|x| x.task_id}
    task_ids = user.completed_tasks.pluck(:task_id)
    user_points = Task.sum(:points, conditions: {id: task_ids})
    if Task.sum(:points, conditions: {id: task_ids, level: 1}) < 1500
      user_level = 1
    elsif Task.sum(:points, conditions: {id: task_ids, level: 2}) < 2000
      user_level = 2
    elsif Task.sum(:points, conditions: {id: task_ids, level: 3}) < 2000
      user_level = 3
    elsif Task.sum(:points, conditions: {id: task_ids, level: 4}) < 2000
      user_level = 4
    elsif Task.sum(:points, conditions: {id: task_ids, level: 5}) < 1500
      user_level = 5
    elsif Task.sum(:points, conditions: {id: task_ids, level: 6}) < 2000
      user_level = 6
    end
    user.points = user_points
    user.level = user_level
    user.save
  end
end