class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart, optional: true
  belongs_to :order, optional: true

  scope :desc, ->{order created_at: :desc}

  def total_price
    product.price * quantity
  end

  def remain_price coupon
    total_price * (100 - coupon.percent) / 100
  end

  def sale_price coupon
    remain_price(coupon) * quantity
  end
end
