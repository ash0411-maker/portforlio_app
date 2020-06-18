class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # whenの後はモデル名
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_home_top_path
    end
  end

  def after_sign_out_path_for(resource)
    if resource == :admin
      new_admin_session_path
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end
end
