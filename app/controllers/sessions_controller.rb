class SessionsController < Devise::SessionsController

  def new
    # add custom logic here
    @start = true
    super
  end

end 