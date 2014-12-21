Rails.application.routes.draw do
  root 'home#index'

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :cart do
    resources :users do
      resources :addresses, only: :index
    end
  end

  resources :categories, only: :index do
    resources :products, only: [:index, :show]
  end

  resources :products, only: [:index, :show] do
    resources :items, only: [:create]
  end

  resources :orders, only: [:show, :index] do
    get ":id/status/:status", action: :show, as: :status, on: :collection
  end

  resources :carts, only: [:show, :edit, :update] do
    resources :addresses, only: [:new, :create]
  end

  resources :items, only: [:create, :update, :destroy]
  resources :addresses, except: [:show, :index]
  resources :users do
    resources :orders, only: [:show, :index]
    resources :addresses, except: [:show, :index]
  end

  resources :guests, only: [:new, :create, :update]
end
