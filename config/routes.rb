Rails.application.routes.draw do
  root 'products#index'

  get 'sessions/new'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  get '/edit', to: 'users#edit'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users

  resources :products, only: [:index]

  resources :account_activations, only: [:edit]

  get '/cart', to: 'carts#show'
  post '/order_items/:id', to: 'order_items#create'
  get '/order_items/update', to: 'order_items#update'
  resources :carts do
    delete :destroy
  end
  resources :order_items, only: [:create, :update, :destroy]

  namespace :admin do
    get '/products/new', to: 'products#new'
    get '/products/:id', to: 'products#index'
    get '/products/edit', to: 'products#edit'
    resources :products, only: [:destroy, :index, :create, :new, :edit, :update]
    resources :users, only: [:destroy, :index]
  end
end
