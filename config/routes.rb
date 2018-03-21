Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    resources :carts, only: %i(show destroy)
    resources :line_items, only: %i(index create destroy)
    post "/increase/:id", to: "line_items#index", as: :quantity
    devise_for :users, controllers: { registrations: "registrations" }
    resources :users
    root "static_pages#home"
    post "orders/new", to: "orders#create"
  end
end
