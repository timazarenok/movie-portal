class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        user_root_path
    end
    def after_sign_out_path_for(resource_or_scope)
        destroy_user_session_path
    end
end
