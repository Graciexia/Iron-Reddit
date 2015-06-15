Rails.application.routes.draw do
  resources :boards
  resources :votes
  resources :comments
  resources :links
  resources :users

end
