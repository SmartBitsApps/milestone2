class DashboardController < ApplicationController
  before_filter :authenticate_user!
  
  
   def index
      case current_user.role
        when "admin"
          #do something
          render "dashboard/admin"
        when "manager"
          #do something
          render "dashboard/manager"
        when "user"
          @user = current_user
          render "dashboard/user"  
        else
          redirect_to root_path, notice: "Go AWAY !!"
      end
   end
end

