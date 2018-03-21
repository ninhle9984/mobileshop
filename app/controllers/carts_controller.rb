class CartsController < ApplicationController
	attr_reader :cart
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
		current_cart = Cart.find_by id: session[:cart_id]
		return if cart && cart.current_cart?(current_cart)
		redirect_to root_url
		flash[:notice] = "Invalid cart"
	end
end