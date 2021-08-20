Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
  resources :addresses, only: [:index, :create]
  resources :prefectures, only: [:index]
  end
  resources :users, only: :show
  
end
