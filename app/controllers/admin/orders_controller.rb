class Admin::OrdersController < AdminController
  def index
    @order = Order.all
  end

  def edit
    Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.handled = true
    @order.save
    redirect_to admin_orders_path
  end
end
