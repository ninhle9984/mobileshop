class OrdersController < ApplicationController
  attr_reader :cart, :order

  before_action :set_cart, only: %i(new create)
  before_action :ensure_cart_isnt_empty, only: :new

  def new
    @order = Order.new
  end

  def create
    @order = Order.new order_params
    order.add_line_items_from_cart cart

    return create_success if order.save
    render :new
  end

  private

  def order_params
    params.require(:order).permit :name, :email, :address, :phone
  end

  def ensure_cart_isnt_empty
    return unless cart.line_items.empty?
    redirect_to root_url
    flash[:notice] = "Your cart is empty"
  end

  def create_success
    OrderMailer.order_info(@order).deliver_now
    cart.destroy
    session[:card_id] = nil
    redirect_to root_url
    flash[:notice] = "Thanks for your order"
  end
end
