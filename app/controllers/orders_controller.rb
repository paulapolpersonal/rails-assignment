class OrdersController < ApplicationController
  def index
  end

  def new
  end

  def show
    @order = Order.find(params[:id])
  end
end
