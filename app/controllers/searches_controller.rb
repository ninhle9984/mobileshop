class SearchesController < ApplicationController
  attr_reader :products

  before_action :force_json

  def index
    @products = Product.ransack(name_cont: params[:q]).result distinct: true
    respond_to do |format|
      format.json{products}
    end
  end

  private

  def force_json
    request.format = :json
  end
end
