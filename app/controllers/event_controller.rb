class EventController < ApplicationController

#pour n'autoriser que les users à aller sur la page secrète :
	before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
  	@event = Event.new
  end

  def show
		@event = Event.find_by(id:params[:id])
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

		if @event.save
			flash[:success] = "Event successfully added! 👍"
			#Show events index
			redirect_to '/'
		else
    	# Keeps on the new event view
    	render 'new' 
    end
  end

	def destroy

  	@event= Event.find_by(id:params[:id])

  	if @event.destroy
  		redirect_to "/"
		end
	end

end
