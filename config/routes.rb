Rails.application.routes.draw do
get 'sessions/new'
resources :boards
resources :votes
resources :comments
resources :links
resources :users
get '/signup', to: 'users#new'

get '/login', to: 'sessions#new', as: 'login'
post '/login', to: 'sessions#create', as: 'create_session'
get '/logout', to: 'sessions#destroy', as: 'logout'

root 'links#index'

end
