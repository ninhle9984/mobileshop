class SupportCoupon
  attr_reader :order

  def initialize args = {}
    @order = args[:order]
  end

  def line_items
    @line_items ||= order.line_items
  end

  def coupon
    @coupon = Coupon.find_by code: order.coupon_code
  end
end
