class UsersController < ApplicationController
  before_action :authenticate_user!
  def profile
      
  end
  helper_method :after_sign_out_path_for
end
