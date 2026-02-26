class ApplicationController < ActionController::Base
  # allow additional parameters through Devise controllers if needed
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [])
    devise_parameter_sanitizer.permit(:account_update, keys: [])
  end
end
