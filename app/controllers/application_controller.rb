class ApplicationController < ActionController::Base
  def after_sign_in_path_for(_resource)
    if current_user.admin?
      admin_root_path
    else 
      user_root_path
    end
  end
  def after_sign_out_path_for(_resource_or_scope)
    root_path
  end
end
