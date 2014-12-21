Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :products, only: [:index, :show]
  resources :categories, only: :index do
    resources :products, only: [:index, :show]
  end
end
