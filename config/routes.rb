Rails.application.routes.draw do
  resources :vendors

  resources :venues do
    collection { post :import }
  end

  root to: 'visitors#index'
  devise_for :users
  resources :users

  get '/kitchen', to: 'visitors#kitchen'
end
