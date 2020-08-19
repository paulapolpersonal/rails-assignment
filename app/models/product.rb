class Product < ApplicationRecord
  has_many :order_items
  has_many :order_products
  has_one_attached :image
  validates :name, :description, :price, presence: true
end
