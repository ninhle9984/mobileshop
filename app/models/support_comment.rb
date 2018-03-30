class SupportComment
  attr_reader :product, :page

  def initialize args = {}
    @product = args[:product]
    @page = args[:page]
  end

  def comments
    @comments ||= product.comments.desc.paginate page: page
  end

  def create_comment
    @create_comment ||= product.comments.build
  end
end
