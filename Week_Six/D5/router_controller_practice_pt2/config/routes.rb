Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users
  
  # get '/users/', to: 'users#index'
  # get '/users/:id', to: 'users#show', as: 'user'
  # post '/users/', to: 'users#create', as: 'new_user'
  # patch '/users/:id', to: 'users#update', as: 'user_update'
  # delete '/users/:id', to: 'users#destroy', as: 'bye_user'

  resources :users do
    resources :artworks, only: [:index]
    resources :artwork_shares, only: [:index]
    resources :comments, only: [:index]
  end
  
  resources :artworks, except: [:index] do
    resources :comments, only: [:index]
  end

  resources :artwork_shares, only: [:index, :create, :destroy]
  
  resources :comments, only: [:index, :create, :destroy]
end