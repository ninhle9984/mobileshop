class CartsController < ApplicationController
  attr_reader :cart

  before_action :find_cart
  before_action :find_coupon

  def show; end

  def destroy
    cart.line_items.destroy_all
    redirect_to root_path
  end

  private

  def find_cart
    @cart = Cart.find_by id: params[:id]
  end
end
