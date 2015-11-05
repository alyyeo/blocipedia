Rails.application.routes.draw do

  devise_for :users
  resources :charges, only: [:new, :create]
  resources :wikis
  resources :users, only: [:show, :update] do
    put :change_role
  end
  root 'wikis#index'
end
