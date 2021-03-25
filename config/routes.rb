Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  namespace :api do
    post '/phone/:number'=>'phones#create'
    post '/phone'=>'phones#create'
  end

  resources :stores
end
