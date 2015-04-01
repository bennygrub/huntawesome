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
    level_figures
    @points_toward_next_level = calculate_current_level_points
    @level_percentage = ((@points_toward_next_level)/(@level_points/100))
  end

  def current_tasks
    calculate_total_points
    level_figures
    @points_toward_next_level = calculate_current_level_points
    level_tasks = @tasks.map{|t| t.id}
    unfinished_task_ids = level_tasks - @completed_task_ids
    @tasks = unfinished_task_ids.map{|t| Task.find(t)}
  end
 
  def completed_tasks
    calculate_total_points
    level_figures
    @points_toward_next_level = calculate_current_level_points
    @tasks = @completed_task_ids.map{|t| Task.find(t)}
  end

  def invite
    calculate_total_points
    level_figures
    @points_toward_next_level = calculate_current_level_points
    @group_members = @group.first.users
    @invited_members = @group.first.invites
    @invite = Invite.new
  end


  def welcome

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

  def calculate_current_level_points
    @points_toward_next_level = Task.sum(:points, conditions: {id: @completed_task_ids, level: @level})
  end


  def level_figures
    if Task.sum(:points, conditions: {id: @completed_task_ids, level: 1}) < 1500
      @level = 1
      @pillar = "Momentum"
      @level_points = 1500
      @level_description = "Every journey starts with the first step. Earn your first #{@level_points} points with these small but impactful challenges. Get your awesome muscles warmed up and earn your Momentum badge!"
    elsif Task.sum(:points, conditions: {id: @completed_task_ids, level: 2}) < 2000
      @level = 2
      @pillar = "Nostalgia"
      @level_points = 2000
      @level_description = "You have to know where you've been to know where your going. Achieve your Nostalgia badge by earning 2000 points while reliving the awesome people, places, and things that make up you."
    elsif Task.sum(:points, conditions: {id: @completed_task_ids, level: 3}) < 2000
      @level = 3
      @pillar = "Connecting with People"
      @level_points = 2000
      @level_description = "In order to really know your self you must first know others. Connect with others in fun and creative way to give and take the Awesome!"
    elsif Task.sum(:points, conditions: {id: @completed_task_ids, level: 4}) < 2000
      @level = 4
      @pillar = "The Awesome You"
      @level_points = 2000
      @level_description = "Congratulations - few make it this far. Go for the gold and challenge yourself - this when you get to be the Awesome you."
    elsif Task.sum(:points, conditions: {id: @completed_task_ids, level: 5}) < 1000
      @level = 5
      @pillar = "Bonus Badge - Random Acts of Kindness"
      @level_points = 2000
      @level_description = "Awesomeness is one part Kindness. So quickly deposit 1000 points of random awesomeness on your community."
    elsif Task.sum(:points, conditions: {id: @completed_task_ids, level: 6}) < 1000
      @level = 6
      @pillar = "Out of Your Comfort Zone"
      @level_points = 2000
      @level_description = "We like to call it Unpredictably Awesome. In order to reach your potential you must stretch your current you. Get out there and reek some comfort stretching awesome while earning 2000 points and your Comfort Busted badge."
    end
    @tasks = Task.where("level = ?", @level)
  end
end
