class UsersController < ApplicationController
  before_action :authenticate_user!

  def create
    UserMailer.welcome_email(@user).deliver_now 
  end
  
  def profile
    @user = current_user
  end

end
