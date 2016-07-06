class AfterRegisterController < ApplicationController
  include Wicked::Wizard
  
  before_filter :authenticate_user!
  
  steps :add_name, :add_birth
  
  def show
    @user = current_user
    render_wizard
  end
  
  def update
    @user = current_user
    @user.update_attributes(user_params)
    
    if wizard_path == after_register_path(:add_birth)
      check_or_update_registration
    else
      render_wizard @user
    end
    
  end
  
  
  private
    
    def check_or_update_registration
      if (@user.first_name.blank? || @user.last_name.blank? || @user.birth_name.blank? ||
        @user.birth_date.blank? ||  @user.birth_date.blank? || @user.gender.blank? ||
        @user.birth_number.blank? ||  @user.birth_place.blank?)
      
        redirect_to after_register_path(:add_name), :notice => "Zkontrolujte položky. Všechny musí být vyplněny."
      
      else
        @user.name = [@user.first_name, @user.last_name].join(' ')
        @user.status = "registered"
        @user.save
        redirect_to root_path, :notice => "Povedlo se! Děkujeme za registraci. Můžete se přihlašovat k akcím."
      end
    end
    
    def user_params
      params.require(:user).permit(:first_name, :last_name, :birth_name, 
                    :birth_date, :gender, :birth_number, :birth_place)
    end
    
end