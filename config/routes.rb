Rails.application.routes.draw do

  resources :users
  resources :users do
  	resources :gossips
  end

	root to: 'users#index'

	get '/login'     => 'sessions#new'
	
	# create (post) action for when log in form is submitted:
	post '/login'    => 'sessions#create'
	
	# delete action to log out:
	delete '/logout' => 'sessions#destroy'  
  	get '/logout' => 'sessions#destroy'
  	# ----- end of added lines -----
	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
