Rails.application.routes.draw do

  get 'users/new'

  get 'users/create'

  root 'home#index'

end
