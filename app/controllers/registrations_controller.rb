class RegistrationsController < Devise::RegistrationsController

  def new
    # add custom logic here
    @start = true
    @solo = params[:solo]
    super
  end

end