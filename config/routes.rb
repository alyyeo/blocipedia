Rails.application.routes.draw do

  devise_for :users
  resources :wikis
  resources :users, only: :show
  root 'wikis#index'
end
