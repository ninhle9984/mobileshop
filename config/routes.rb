Rails.application.routes.draw do
	root "products#index"
	post "/up/:id", to: "line_items#index", as: :quantity
  resources :products
  resources :line_items
  resources :carts, only: %i(show destroy)
  resources :orders
  post "orders/new", to: "orders#create"
end
