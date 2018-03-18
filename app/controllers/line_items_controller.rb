class LineItemsController < ApplicationController
	before_action :set_cart
	def create
		product = Product.find(params[:product_id])
		@line_item = @cart.add_product(product)

		if @line_item.save
			flash[:notice] = "Added!"
			redirect_to @line_item.cart
		else
			flash[:danger] = "errors"
			redirect_to root_url
		end
	end

	def destroy
		@item = LineItem.find params[:id]
		@item.destroy
		redirect_to @cart
		flash[:notice] = "Item was removed"
	end

	def up
		@item = LineItem.find params[:id]
		@item.update_attribute(:quantity, @item.quantity +=1)
		redirect_to @cart
		flash[:notice] = "Increased!"
	end

	def down
		@item = LineItem.find params[:id]
		return if @item.quantity == 1
		@item.update_attribute(:quantity, @item.quantity -= 1)
		redirect_to @cart
		flash[:notice] = "Decrease!"
	end
end