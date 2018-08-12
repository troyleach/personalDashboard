Rails.application.routes.draw do

  root 'users#new'
  resources :users

  get '/home', to: 'home#index', as: 'home'

end
