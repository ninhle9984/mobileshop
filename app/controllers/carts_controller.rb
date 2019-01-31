class CartsController < ApplicationController
  attr_reader :cart

  before_action :current_cart
  before_action :find_coupon

  def show; end

  def destroy
    cart.line_items.destroy_all
    flash[:success] = "Cart are empty"
    redirect_to root_path
  end
end
