Rails.application.routes.draw do
  devise_for :users
<<<<<<< Updated upstream
  root 'items#index'
=======
  root to: 'items#index'
>>>>>>> Stashed changes
  resources :items
end
