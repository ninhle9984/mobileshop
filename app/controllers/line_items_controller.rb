class LineItemsController < ApplicationController
	attr_reader :item, :cart
	before_action :set_cart
	before_action :set_item, only: [:up, :down]
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

	def index
		item = LineItem.find params[:id]

		return increase(item) if params[:method] == "increase"
		decrease item
	end

	def down
		@item = LineItem.find params[:id]
		return if item.quantity == 1
		@item.update_attribute(:quantity, quantity -= 1)
		redirect_to @cart
		flash[:notice] = "Decrease!"
	end

	private

	def set_item
		@item = LineItem.find params[:id]
		@quantity = @item.quantity
	end

  def increase item
    quantity = item.quantity + 1
    item.update_attributes quantity: quantity
    redirect_to cart
  end

  def decrease item
    quantity = item.quantity - 1
    return if quantity.zero?
    item.update_attributes quantity: quantity
  end
end