class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    return admin_root_path if current_user.admin?

    user_root_path
  end

  def after_sign_out_path_for(_resource_or_scope)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:image, :current_password, :email, :name, :surname, :password, :password_confirmation, :remember_me)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:image, :current_password, :email, :name, :surname, :password, :password_confirmation, :remember_me)
    end
  end
end
