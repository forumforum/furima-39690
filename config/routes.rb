Rails.application.routes.draw do
  devise_for :users
  root 'items#index'

  resources :items do
    resources :orders, only: [:index, :create]
    resources :comments, only: :create
    resources :users do
      resource :relationships, only: [:create, :destroy]
    end
  end

end
