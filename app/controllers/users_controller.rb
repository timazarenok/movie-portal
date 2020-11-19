class UsersController < ApplicationController
  before_action :authenticate_user!
  def profile; end

  def create
    if 
      UserMailer.with(user: @user).welcome_email.deliver_later 
    end
end
