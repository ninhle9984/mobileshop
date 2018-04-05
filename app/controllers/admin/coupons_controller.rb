module Admin
  class CouponsController < ApplicationController
    before_action :find_coupon, only: %i(edit update destroy)

    def index
      @coupons = Coupon.desc.paginate page: params[:page]
    end

    def new
      @coupon = Coupon.new
    end

    def create
      @coupon = Coupon.new coupon_params

      if coupon.save
        flash[:success] = t "created"
        redirect_to admin_coupons_path
      else
        render :new
      end
    end

    def edit; end

    def update
      if coupon.update_attributes coupon_params
        flash[:success] = t "updated"
        redirect_to admin_coupons_path
      else
        render :edit
      end
    end

    def destroy
      redirect_to admin_coupons_path if coupon.destroy
      unsuccess_destroy
    end

    private

    attr_reader :coupon

    def coupon_params
      params.require(:coupon).permit :code, :expire, :import, :percent
    end

    def find_coupon
      @coupon = Coupon.find_by id: params[:id]

      return if coupon
      flash[:errors] = t "not_found"
      redirect_to root_path
    end

    def unsuccess_destroy
      flash[:danger] = t "not_exist"
      redirect_to root_path
    end
  end
end
