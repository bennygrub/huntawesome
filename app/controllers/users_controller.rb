class UsersController < ApplicationController
  before_action :set_instance, only: [:show, :edit, :update, :destroy, :current_tasks, :completed_tasks, :invite]
  before_filter :authenticate_user!

  def index
  end

  def create
  end

  def new
  end

  def destroy
  end

  def show
    calculate_total_points
    level_figures(@total_points)
    @points_toward_next_level = @total_points-(@level_points*(@level-1))
    @level_percentage = ((@points_toward_next_level)/(@level_points/100))
  end

  def current_tasks
    calculate_total_points
    level_figures(@total_points)
    level_tasks = @tasks.map{|t| t.id}
    unfinished_task_ids = level_tasks - @completed_task_ids
    @tasks = unfinished_task_ids.map{|t| Task.find(t)}
  end
 
  def completed_tasks
    calculate_total_points
    level_figures(@total_points)
    @tasks = @completed_task_ids.map{|t| Task.find(t)}
  end

  def invite
    calculate_total_points
    level_figures(@total_points)
    @group_members = @group.first.users
    @invited_members = @group.first.invites
    @invite = Invite.new
  end

  private

  def set_instance
    @user = User.find(params[:id])
    @group = @user.groups
  end

  def calculate_total_points
    @completed_task_ids = @group.first.completed_tasks.map{|t| t.task_id}
    @total_points = Task.sum(:points, conditions: {id: @completed_task_ids})
  end

  def level_figures(total_points)
    if total_points < 2000
      @level = 1
      @tasks = Task.where("level = ?", 1)
      @level_points = 2000
      #@level_1_total_points = Task.sum(:points, conditions: {id: @completed_task_ids, level: 1})
    elsif total_points < 4000
      @level = 2
      @tasks = Task.where("level = ?", 2)
      @level_points = 2000
    elsif total_points < 6000
      @level = 3
      @tasks = Task.where("level = ?", 3)
      @level_points = 2000
    elsif total_points < 8000
      @level = 4
      @tasks = Task.where("level = ?", 4)
      @level_points = 2000
    else
      @level = 5
      @tasks = Task.where("level = ?", 5)
      @level_points = 2000
    end
  end
end
