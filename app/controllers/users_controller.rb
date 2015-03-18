class UsersController < ApplicationController
  def index
  end

  def create
  end

  def new
  end

  def destroy
  end

  def show
    @user = User.find(params[:id])
    @group = @user.groups
    @tasks = Task.where("level = ?", 1)
    @completed_task_ids = @user.completed_tasks.map{|t| t.group_id}
    @level_1_total_points = Task.sum(:points, conditions: {id: @completed_task_ids, level: 1})
  end
end
