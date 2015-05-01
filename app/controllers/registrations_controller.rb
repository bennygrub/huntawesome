class RegistrationsController < Devise::RegistrationsController

  def new
    # add custom logic here
    @start = true
    @solo = params[:solo]
    super
  end

  def create
    @start = true
    super
  end
  
  def after_sign_up_path_for(resource)
    flash[:notice] = ""
    welcome_user_path(current_user)
  end
end