class UsersController < ApplicationController
  before_action :authenticate_user!
  def profile; end

  def create
    UserMailer.welcome_email(@user).deliver_now 
  end
end