Rails.application.routes.draw do
  root "home#index"
  resources :promotions do
    member do
      patch :toggle_active
    end
  end
  resources :authors
  resources :categories, param: :slug
  resources :books, param: :slug
  resources :promotions
end
