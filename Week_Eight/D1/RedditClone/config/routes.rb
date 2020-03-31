Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :index, :destroy]
  resource :session, only: [:new, :create, :destroy]
end
