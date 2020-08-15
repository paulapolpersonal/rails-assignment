class CartsController < ApplicationController
  def show
    @order_items = current_user.cart.order_items
  end
end
