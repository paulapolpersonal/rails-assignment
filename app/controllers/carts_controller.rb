class CartsController < ApplicationController
  def show
    @order_items = current_user.cart.order_items
  end

  def destroy
    @cart.order_items.delete_all
    redirect_to @cart
  end
end
