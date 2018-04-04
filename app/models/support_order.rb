class SupportOrder
  attr_reader :coupon

  def initialize session
    @coupon ||= Coupon.find_by code: session if session
  end

  def order
    @order ||= Order.new
  end
end
