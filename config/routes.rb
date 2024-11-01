Rails.application.routes.draw do
  root "home#index"
  resources :authors
  resources :categories, param: :slug
  resources :books, param: :slug
end
