Rails.application.routes.draw do
  resources :items, only: [:index, :show]
  resources :categories, only: [:show]
  resources :cart_items, only: [:create]
  resources :orders, only: [:new, :create]
  resources :users, only: [:new, :create, :show, :update]
  resources :charges

  namespace :admin do
    resources :items
    resources :categories
    resources :users, only: [:show, :update]
    resources :orders, only: [:update]
  end

  root 'welcome#index'

  put '/cart_items', to: "cart_items#update"
  delete '/cart_items', to: "cart_items#destroy"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  get 'auth/:provider/callback', to: 'omniauth_sessions#create'
  get '/twitterlogin' => redirect('auth/twitter'), as: :twitter_login
end
