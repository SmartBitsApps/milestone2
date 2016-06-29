class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_filter :authenticate_user!
  after_action :verify_authorized
  
  def index
    @users = User.all
    authorize User
  end
  
  def show
    authorize @user
  end
  
  def edit
    authorize current_user
  end
  
  def update
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "Uživatel aktualizován."
    else
      redirect_to users_path, :alert => "Nebylo možné uživatele aktualizovat."
    end
  end
  
  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, :notice => "Uživatel byl smazán."
  end
  
  private
  
    def set_user
      @user = User.find(params[:id])
    end

    def secure_params
      params.require(:user).permit(:role)
    end
  
end
