Rails.application.routes.draw do
  resources :tweets
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
