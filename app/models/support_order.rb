class SupportOrder
  attr_reader :order

  def initialize args
    @order = args[:order]
  end

  def find_coupon
    Coupon.find_by code: order.coupon_code
  end
end
