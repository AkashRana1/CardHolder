Rails.application.routes.draw do
  root "users#new"
  post "/bank_create", to: "users#bank_create"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  resources :users, except: [:new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
