class ProductsController < ApplicationController
  attr_reader :product

  before_action :find_product, only: %i(show index)
  before_action :all_brands, only: %i(index show)

  def index; end

  def show; end

  private

  def all_brands
    @brands = Brand.desc.all
  end

  def find_product
    @product = Product.find_by id: params[:id]

    return if product
    flash[:success] = t "failed_product"
    redirect_to root_path
  end
end
