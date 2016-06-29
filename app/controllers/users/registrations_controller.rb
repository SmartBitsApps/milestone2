class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:role, :avatar, :first_name, :last_name, :name, :birth_name, 
                                  :birth_date, :gender, :birth_number, :birth_place, :nationality, :family_status, :status,
                                  :remove_avatar, :avatar_cache])
  end
end