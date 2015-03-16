class RegistrationsController < Devise::RegistrationsController

  def new
    # add custom logic here
    @start = true
    super
  end

end