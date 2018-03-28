class StaticPagesController < ApplicationController
  before_action :page, only: %i(index)

  def index
    @brands = Brand.desc.paginate page: page
    @products = Product.desc.paginate page: page
  end

  private

  def page
    params[:page]
  end
end
