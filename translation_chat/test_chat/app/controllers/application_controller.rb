class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :nationality_type, :gender, :admin])
  end

  def authenticate
    redirect_to new_user_session_path unless user_signed_in?
  end

  def authenticate_admin
    unless current_user.admin
      redirect_to '/'
    end
  end
end
