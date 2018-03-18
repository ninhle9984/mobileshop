class CartsController < ApplicationController
	before_action :find_cart

	def show
	end

	def destroy
		@cart.destroy
		session[:cart_id] = nil
		redirect_to root_url
		flash[:notice] = "Cart Emptied!"
	end

	private

	def find_cart
		@cart = Cart.find_by id: params[:id]
		if @cart.nil? || (@cart.id != session[:cart_id])
			redirect_to root_url
			flash[:notice] = "Invalid cart"
		end
	end
end