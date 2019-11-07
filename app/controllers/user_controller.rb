class UserController < ApplicationController
  

  def show

  	@user = User.find(params[:id])
#on définit current user :
 		@current_user = @user
  	
#on définit les évenements créés
  	@created_events = Event.where(admin_id: @user.id)

    @events = Event.all

    #Pas encore vu?
    # events_aging(@events)
    # @upcoming = @user.attending_events & @upcoming
    # @past = @user.attending_events & @past

  end












  
end
