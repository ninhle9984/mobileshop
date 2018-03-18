Rails.application.routes.draw do
	root "products#index"
  resources :products
  resources :line_items
  resources :carts
end
