Rails.application.routes.draw do
  root 'welcome#index'
  resources :items, only: [:index]
  resources :categories, only: [:show]
  resources :carts, only: [:create]
  put '/carts', to: 'carts#update'
  delete '/carts', to: "carts#destroy"
  resources :orders, only: [:new]
  resources :users, only: [:new, :create, :show]
end
