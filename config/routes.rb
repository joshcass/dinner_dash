Rails.application.routes.draw do
  resources :items, only: [:index]
  resources :categories, only: [:show]
  resources :carts, only: [:create]
  resources :orders, only: [:new]
  root 'welcome#index'
end
