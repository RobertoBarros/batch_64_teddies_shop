Rails.application.routes.draw do
  devise_for :users
  root to: 'teddies#index'

  resources :teddies, only: [:index, :show]
  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end
end
