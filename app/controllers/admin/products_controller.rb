module Admin
  class ProductsController < Admin::BaseController
    attr_reader :product

    before_action :find_product, only: %i(show)
    before_action :brands, only: %i(index show)
    before_action :paginate_product, only: %i(index)

    def index; end

    def show; end

    private

    def brands
      @brands = Brand.desc.all
    end

    def paginate_product
      @products = Product.desc.paginate page: params[:page]
    end

    def find_product
      @product = Product.find_by id: params[:id]

      return if product
      flash[:success] = t "failed_product"
      redirect_to root_path
    end
  end
end
