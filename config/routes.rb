Rails.application.routes.draw do
	namespace :api do
		namespace :v1 do
				 post :filter, to: "users#filters"
				 post :sort, to: "users#sorting"
				 put "/users/:user_status/:id", to: "users#user_status"
				 resources :users
				 post :filter, to: "tags#filters"
				 post :sort, to: "tags#sorting"
				 resources :tags				 
				 resources :sessions
		end
	end
end
