class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters
  
  def create
    super
  end
  
  protected
  
  def after_sign_up_path_for(resource)
    after_register_path(:add_name)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :remember_me])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: [:role, :avatar, :first_name, :last_name, :name, :birth_name, 
                                  :birth_date, :gender, :birth_number, :birth_place, :nationality, :family_status, :bank_acc, 
                                  :insurance, :occupation, :status, :reg_progress, :remove_avatar, :avatar_cache, :password, :password_confirmation])
  end
end 