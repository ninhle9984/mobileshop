class CartsController < ApplicationController
	before_action :find_cart

	def show
	end

	private

	def find_cart
		@cart = Cart.find params[:id]
	end
end