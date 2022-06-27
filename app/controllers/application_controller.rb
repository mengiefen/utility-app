class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:home]


  private
  def after_sign_out_path_for(resource_or_scope)
    home_path
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name) }
  end
end
