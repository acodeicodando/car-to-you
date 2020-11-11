Rails.application.routes.draw do

  devise_for :users, only: :sessions
  root 'home#index'

  resources :users, except: :new
  resources :cars, only: :index
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
