Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root "home#index"

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
    root to: 'admins#index'
  end
  
end
