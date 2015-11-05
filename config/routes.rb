Rails.application.routes.draw do

  devise_for :users
  resources :charges, only: [:new, :create]
  resources :wikis
  resources :users, only: [:show, :update] do
    put :to_premium
    put :to_standard
  end
  root 'wikis#index'
end
