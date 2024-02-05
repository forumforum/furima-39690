Rails.application.routes.draw do
  devise_for :users
  root 'items#index'

  resources :users do
    resource :relationships, only: [:create, :destroy]
  end

  resources :items do
    resources :orders, only: [:index, :create]
    resources :comments, only: :create
  end

  resources :comments, only: [:index, :new, :create] do
    resource :likes, only: [:create, :destroy]
  end
end
