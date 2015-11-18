class StaticPagesController < ApplicationController
  def home
    unless logged_in?
      render "signup_or_login"
    end
  end

  def signup_or_login
  end
end
