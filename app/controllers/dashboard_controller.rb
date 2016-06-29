class DashboardController < ApplicationController
  before_filter :authenticate_user!
  
  
   def index
      case current_user.role
        when "admin"
          #@user = current_user
          render "dashboard/admin"
        when "manager"
          #@user = current_user
          render "dashboard/manager"
        when "user"
          @user = current_user
          render "dashboard/user"  
        else
          redirect_to root_path, notice: "Go AWAY !!"
      end
   end
end

