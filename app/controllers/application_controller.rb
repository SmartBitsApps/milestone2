class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |user|
        user.permit(:first_name, :last_name, :email, :password, :password_confirmation)
      end
      devise_parameter_sanitizer.permit(:account_update) do |user|
        user.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :avatar)
      end
    end
    
    def user_not_authorized
      flash[:alert] = "Přístup zamítnut."
      redirect_to (request.referrer || root_path)
    end
    
end
