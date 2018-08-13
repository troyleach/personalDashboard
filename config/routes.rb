Rails.application.routes.draw do
  root 'users#new'

  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

  get '/home', to: 'home#index', as: 'home'

  resources :sessions, only: [:create]
  resources :users, only: [:new, :create]
end
