class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?



  protected
  
  def after_sign_in_path_for(resource_or_scope)
      if resource_or_scope.is_a?(Admin)
          admin_users_path
      else
          root_path
      end
  end

  def after_sign_out_path_for(resource_or_scope)
       if resource_or_scope == :public
           root_path
       elsif resource_or_scope == :admin
           new_admin_session_path
       else
           root_path
       end
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name,:furigana,:telephone_number,:login_name])
  end
end