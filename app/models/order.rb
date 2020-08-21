class Order < ApplicationRecord
  has_many :order_products
  belongs_to :user

  validates :address, presence: true
  validates :phone_number, presence: true
end
