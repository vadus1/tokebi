Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :categories, only: :index do
    resources :products, only: [:index, :show]
  end
end
