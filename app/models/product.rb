class Product < ApplicationRecord
  has_one_attached :image
  validates :name, :description, :price, presence: true
end
