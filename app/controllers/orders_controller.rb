class OrdersController < ApplicationController
  attr_reader :cart, :order, :line_items, :line_item

  before_action :current_cart, only: %i(new create)
  before_action :ensure_cart_isnt_empty, only: :new
  before_action :find_order, only: %i(show update)
  before_action :find_line_item, only: %i(show edit)

  def new
    @order = Order.new
  end

  def create
    @order =
      if current_user
        current_user.orders.build order_params
      else
        Order.new order_params
      end

    order.add_line_items_from_cart cart

    return create_success if order.save
    render :new
  end

  def show
    @line_items = order.line_items
    redirect_to root_path unless current_user?

    current_order if current_user?
  end

  def update
    order.update_attributes order_status: "cancelled"
    redirect_to order
  end

  private

  def current_user?
    current_user
  end

  def current_order
    return if current_user.orders.find_by id: params[:id]
    redirect_to root_path
  end

  def find_line_item
    @line_item = LineItem.find_by order_id: params[:id]

    return if line_item
    flash[:warning] = t "failed_line_item"
    redirect_to root_path
  end

  def find_order
    @order = Order.find_by id: params[:id]

    return if order
    flash[:warning] = t "failed_order"
    redirect_to root_path
  end

  def order_params
    params.require(:order).permit :name, :email, :address, :phone
  end

  def ensure_cart_isnt_empty
    return unless cart.line_items.empty?
    redirect_to root_url
    flash[:notice] = t "empty"
  end

  def create_success
    Cart.destroy session[:cart_id]
    session[:card_id] = nil
    redirect_to root_url
    flash[:success] = t "thank"
  end
end
