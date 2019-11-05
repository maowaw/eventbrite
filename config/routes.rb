Rails.application.routes.draw do
  
#le root renvoie à la vue static page méthode index
	get '/', to: 'event#index' 


  devise_for :users

	resources :event


end
