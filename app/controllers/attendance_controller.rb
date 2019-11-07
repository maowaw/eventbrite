class AttendanceController < ApplicationController

	def index
		# @event = Event.find(params["id"])
		# @attendance = @event.user.ids
	end


	def new
		@attendance = Attendance.new
	end

	def create

		@attendance = Attendance.create(user_id: params[:user_id], event_id: params[:event_id])

	  # Amount in cents
	  @amount = 500

		#creation d'un client en 2 paramètres
	  customer = Stripe::Customer.create({
	    email: params[:stripeEmail],
	    source: params[:stripeToken], #stripetoken représente la méthode de paiement
	  })

	  charge = Stripe::Charge.create({
	    customer: customer.id,
	    amount: @amount,
	    description: 'Rails Stripe customer',
	    currency: 'usd',
	  })

		#regroupe tous types d'erreur
		rescue Stripe::CardError => e
		  flash[:error] = e.message
		  redirect_to new_charge_path
	end

end

