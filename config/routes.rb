Rails.application.routes.draw do
  resources :items, only: [:index, :show]
  resources :categories, only: [:show]
  resources :carts, only: [:create]
  resources :orders, only: [:new, :show]
  resources :users, only: [:new, :create, :show]

  root 'welcome#index'

  put '/carts', to: "carts#update"
  delete '/carts', to: "carts#destroy"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
end
