Rails.application.routes.draw do
  
#le root renvoie à la vue event méthode index
	get '/', to: 'event#index' 


  devise_for :users

	resources :event
	resources :user



end
