Rails.application.routes.draw do
  resources :vendors

  resources :venues

  root to: 'visitors#index'
  devise_for :users
  resources :users

  get '/kitchen', to: 'visitors#kitchen'
end
