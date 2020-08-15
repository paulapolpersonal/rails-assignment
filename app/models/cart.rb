class Cart < ApplicationRecord
  has_many :order_items
  belongs_to :user

  def subtotal
    order_items.collect{|order_item| order_item.valid? ? order_item.price*order_item.quantity : 0}.sum
  end

  private

  def set_subtotal
    self[:subtotal] = subtotal
  end
end
