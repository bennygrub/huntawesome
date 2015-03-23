class UsersController < ApplicationController
  before_action :set_instance, only: [:show, :edit, :update, :destroy, :current_tasks, :completed_tasks, :invite]
  before_filter :authenticate_user!

  def index
    @users = User.all
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
      @level_points = 2000
      @level_description = "is all about warming up your Awesome muscles. So start small & pick the challenges you feel most comfortable with. Once you hit 2000 points, you'll be ready to turn up the Awesome in Level 2."
      #@level_1_total_points = Task.sum(:points, conditions: {id: @completed_task_ids, level: 1})
    elsif total_points < 4000
      @level = 2
      @level_points = 2000
      @level_description = "is where your Awesomeness begins to shine. Friends & family start to notice something different. They won't know what, but you know - it's your Awesomeness."
    elsif total_points < 6000
      @level = 3
      @level_points = 2000
      @level_description = "is when most hunters really start to step it up. Challenges should become second nature as fear is replaced with your inner Awesome."
    elsif total_points < 8000
      @level = 4
      @level_points = 2000
      @level_description = "means you are friggin Awesome. Congratulations - few make it this far. Go for the gold and challenge yourself. There is only one level to go."
    else
      @level = 5
      @level_points = 2000
      @level_description = "is unchartered territory of Awesome. Complete this level and hit the ultimate level of satisfaction and fun. If you do, you make it to our Wall of Awesome!"
    end
    @tasks = Task.where("level = ?", @level)
  end
end
