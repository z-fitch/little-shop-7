Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :admin, only: [:index]
  namespace :admin do
    resources :merchants, only: [:index, :show, :update, :edit, :new, :create]
    resources :invoices, only: [:index, :show, :update]
  end

  resources :merchants, only: :show do
    get "/dashboard", to: "merchants#show"

    resources :items, except: [:destroy], controller: "merchant_items"

    resources :invoices, only: [:index, :show], controller: "merchant_invoices" 
    resources :bulk_discounts
  end
  
  resources :invoice_items, only: [:update], controller: "merchant_invoice_items"

end
