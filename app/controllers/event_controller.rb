class EventController < ApplicationController

#pour n'autoriser que les users à aller sur la page secrète :
	before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
  	@event = Event.new
  end

  def show

  	#on ne montre les events qu'à ceux qui sont connectés :
  	if user_signed_in?
			@event = Event.find(params[:id])
			@attending_list = @event.users.ids #liste des participants

		#ceux qui ne sont pas connectés sont renvoyés à la page login
		else
			flash[:alert] = "You need to be connected to see the events"
			redirect_to new_user_session_path
		end
	end

	def create 
		@event = Event.new(
			admin: current_user,
			title: params[:title],
			start_date: params[:start_date],
			duration: params[:duration],
			description: params[:description],
			price: params[:price],
			location: params[:location],
			)
		@event.admin_id = @current_user.id

		#si les bons paramètres sont là, on enregistre l'event
		if @event.save
			flash[:success] = "Event successfully added! 👍"
			#on renvoit à l'index
			redirect_to event_path(@event.id)
		
		else
    	#il manque qqchose ou il y a une erreur, on reste sur la page de création (view new)
    	flash.now[:danger] = "Couldn't save."
    	render 'new' 
    end
  end

	def destroy

  	@event= Event.find_by(id:params[:id])

  	#après l'action de destruction, on renvoit à l'accueil
  	if @event.destroy
  		redirect_to "/"
		end
	end

	def edit
		@event = Event.find(params["id"])
	end

# #Pour le paiement en ligne, méthodes suscribe et unsuscribe
# 	def subscribe

# 	  @event = Event.find(params[:event])
# 	  @current_user = current_user
# 	  @event.attendees << @current_user #on rajoute le current user à la liste des attendees

# 	  flash[:success] = "Participation validated!"
# 	  redirect_to user_path(@current_user.id)
# 	  end

# 	  def unsubscribe
# 	    @event = Event.find(params[:event])
# 	    @current_array = []
# 	    @current_array << current_user
# 	    @event.attendees -= @current_array #on enlève le user des attendees
# 	    flash[:success] = "You are no longer participating to this event"
# 	    redirect_to user_path(@current_user.id)
# 	  end


#Pas encore vu?
  # private

  # def params_event
  #   params.require(:event).permit(:description, :date, :place)
  # end


end
