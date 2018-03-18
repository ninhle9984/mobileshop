class Product < ApplicationRecord
	has_many :line_items

	before_destroy :ensure_not_referenced_by_any_line_item

	private

	def ensure_not_referenced_by_any_line_item
		return if line_items.empty?
		errors.add :base, "Line Item present"
		throw :abort
	end
end
