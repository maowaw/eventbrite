Rails.application.routes.draw do
  
#le root renvoie à la vue event méthode index
	get '/', to: 'event#index' 

#routes avec la gem devise
  devise_for :users

#routes pour les controllers event et user
	resources :event do 
		resources :avatars, only: [:create]
	end

	resources :user

#route pour voir les participations (et donc le paiement)
	resources :attendance

end
