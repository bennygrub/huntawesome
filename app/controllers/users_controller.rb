class UsersController < ApplicationController
  before_action :set_instance, only: [:show, :edit, :update, :destroy, :current_tasks, :completed_tasks, :invite]
  before_filter :authenticate_user!
  before_filter :only_admin, only: [:show]

  def index
    @users = User.all
    @users_grid = initialize_grid(@users)
  end

  def create
  end

  def new
  end

  def destroy
  end

  def show
    @tasks = Task.where("level = ?", @user.level)
  end

  def current_tasks
    unfinished_task_ids = Task.where("level = ?", @user.level).pluck(:id) - @user.completed_tasks.pluck(:task_id)
    @tasks = unfinished_task_ids.map{|t| Task.find(t)}
  end
 
  def completed_tasks
    @tasks = @user.completed_tasks.map{|t| Task.find(t.task_id)}
  end

  def invite
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
    @levels = Level.order(pillar: :asc)
  end
    
  def only_admin
    redirect_to current_user if current_user.admin != true && current_user.id != @user.id
  end
end
