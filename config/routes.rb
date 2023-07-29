Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :admin, only: [:index]
  namespace :admin do
    resources :merchants, only: [:index, :show, :update, :edit]
    resources :invoices, only: [:index, :show, :update]
  end

  resources :merchants, only: :show do
    get "/dashboard", to: "merchants#show"

    resources :items, only: [:index, :show], controller: "merchant_items"

    resources :invoices, only: [:index, :show], controller: "merchant_invoices"

    resources :invoices, only: [:index, :show]
  end
end
