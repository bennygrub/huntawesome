class PagesController < ApplicationController
  before_filter :new_home
  
  def home
    @start = true
  end

  def contact
  end

  def about
  end

  def faq
  end

  def start
    @start = true
  end

  private
    def new_home
      redirect_to current_user if current_user
    end
end
