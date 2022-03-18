Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :users, only: [:edit, :update]
  resources :items do
    resources :purchase_records, only: [:index, :new, :create] do
      resources :delivery_address
    end
  end
end
