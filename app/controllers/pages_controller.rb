class PagesController < ApplicationController
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
end
