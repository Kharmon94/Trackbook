class ApplicationController < ActionController::Base
  include CanCan::ControllerAdditions

  # In development, GitHub Codespaces origin checking can conflict with localhost testing
  skip_forgery_protection if Rails.env.development?

  # allow additional parameters through Devise controllers if needed
  before_action :configure_permitted_parameters, if: :devise_controller?

  # handle authorization failures from CanCanCan
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

  protected

  # Load the current user's abilities for CanCanCan
  def current_ability
    @current_ability ||= Ability.new(current_user)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [])
    devise_parameter_sanitizer.permit(:account_update, keys: [])
  end
end
