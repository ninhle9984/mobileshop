Rails.application.routes.draw do
	root "products#index"
	post "/up/:id", to: "line_items#up"
	post "/down/:id", to: "line_items#down"
  resources :products
  resources :line_items
  resources :carts
end
