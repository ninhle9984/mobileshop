class Product < ApplicationRecord
  belongs_to :brand
  has_many :comments, dependent: :destroy
end
