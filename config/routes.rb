Rails.application.routes.draw do
  
  get 'event/index'
	resources :events

	resources :registrations

	resources :users

#le root renvoie à la vue static page méthode index
	get '/', to: 'static_pages#index' 

#créé avec la devise
  get 'static_pages/secret'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
