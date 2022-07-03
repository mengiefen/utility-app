class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:home]
  before_action :redirect_to_home_path

  private

  def redirect_to_home_path
    home_path unless user_signed_in?
  end

  def after_sign_out_path_for(_resource_or_scope)
    home_path
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name email password password_confirmation avatar])
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password password_confirmation avatar])
  end
end
