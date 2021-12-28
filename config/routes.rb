Rails.application.routes.draw do
  root 'events#index'

  resources :events, only: [:index, :show, :new, :create]
  resources :users, only: [:show, :new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
