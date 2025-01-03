Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root "home#index"

  get 'checkout', to: 'orders#new'
  post 'checkout', to: 'orders#create'
  
  resources :promotions do
    member do
      patch :toggle_active
    end
  end

  resources :authors
  resources :categories, param: :slug
  resources :books, param: :slug
  resources :users, only: [:show, :edit, :update]

  namespace :admin do
    resources :users, only: [:index, :edit, :update, :destroy]
    resources :books, only: [:index, :new, :create, :edit, :update, :destroy], param: :slug
    resources :orders, only: [:index, :show]
    root to: 'admins#index'
  end

  resource :cart, only: [:show] do
    post 'add_to_cart', on: :collection
    post 'remove_from_cart', on: :collection
  end

  resources :orders, only: [:new, :create] do
    member do
      get 'confirmation'
    end
  end
end
