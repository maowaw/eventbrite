class UserController < ApplicationController
  def show

#on définit current user :
   if params[:id].to_i == current_user.id.to_i
      @current_user = current_user
    else
      redirect_to "/"
    end

  end
end
