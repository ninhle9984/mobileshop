class LineItemsController < ApplicationController
	before_action :set_cart, only: :create
	def create
		product = Product.find(params[:product_id])
		@line_item = @cart.line_items.build product: product

		if @line_item.save
			flash[:notice] = "Added!"
			redirect_to @line_item.cart
		else
			flash[:danger] = "errors"
			redirect_to root_url
		end
	end
end