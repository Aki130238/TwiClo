Rails.application.routes.draw do
  root to: "tops#index"
  resources :tweets do
    collection do
      post :confirm
    end
  end
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
end
