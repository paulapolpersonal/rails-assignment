Rails.application.routes.draw do
   get 'sessions/new'
   root 'products#index'
   get '/signup', to: 'users#new'
   get '/login', to: 'sessions#new'
   get '/edit', to: 'users#edit'
   post '/login', to: 'sessions#create'
   delete '/logout', to: 'sessions#destroy'
   resources :users
   get '/addproduct', to: 'products#new'
   resources :products
end
