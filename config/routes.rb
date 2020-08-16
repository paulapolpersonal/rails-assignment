Rails.application.routes.draw do
  root 'products#index'

  get 'sessions/new'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  get '/edit', to: 'users#edit'
  get '/users', to: 'users#index'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users

  get '/addproduct', to: 'products#new'
  get '/adminproducts', to: 'products#show'
  get 'products/edit', to: 'products#edit'
  resources :products

  resources :account_activations, only: [:edit]

  get '/cart', to: 'carts#show'
  post '/order_items/:id', to: 'order_items#create'
  get '/order_items/update', to: 'order_items#update'
  resources :carts, only: [:index, :destroy]
  resources :order_items, only: [:create, :update, :destroy]
end
