Rails.application.routes.draw do
  devise_for :users
  root to: 'furimas#index'
  resources :users, only: [:edit, :update]
end
