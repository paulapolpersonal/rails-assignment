class OrderProductsController < ApplicationController
  def index
    @order = Order.find(params[:order])
  end

  def new
    @order = Order.new
  end

  def create
    @cart = current_user.cart
    @order = current_user.orders.new
    @order.phone_number = params[:phone_number]
    @order.address = params[:address]
    @cart.order_items.each do |order_item|
      @order.order_products << OrderProduct.new(product: order_item.product, quantity: order_item.quantity)
    end
    @order.save
    current_user.cart.order_items.destroy_all
    flash[:success]="Order placed successfully"
    redirect_to @order
  end
end
