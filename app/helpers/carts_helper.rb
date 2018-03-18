module CartsHelper
	def set_cart
		@cart = Cart.find_by id: session[:cart_id]

		return if @cart.present?
		@cart = Cart.create
		session[:cart_id] = @cart.id
	end
end