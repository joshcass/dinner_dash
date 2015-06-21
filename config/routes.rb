Rails.application.routes.draw do
  resources :items, only: [:index, :show]
  resources :categories, only: [:show]
  resources :carts, only: [:create]
  resources :orders, only: [:new, :create]
  resources :users, only: [:new, :create, :show, :update]

  namespace :admin do
    resources :items
    resources :categories
    resources :users, only: [:show, :update]
  end

  root 'welcome#index'

  put '/carts', to: "carts#update"
  delete '/carts', to: "carts#destroy"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
end
