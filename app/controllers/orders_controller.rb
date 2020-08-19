class OrdersController < ApplicationController
  def index

  end

  def new
  end

  def show
    @order = current_user.order.order_products
  end
end
