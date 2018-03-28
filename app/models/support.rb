class Support
  def users
    @users ||= User.desc.limit(5)
  end

  def brands
    @brands ||= Brand.desc.all
  end

  def products
    @products ||= Product.desc.all
  end
end
