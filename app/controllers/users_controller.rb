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
  end
end
