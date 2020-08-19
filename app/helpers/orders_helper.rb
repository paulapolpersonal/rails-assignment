module OrdersHelper
  def handle(order)
    if order.handled == false
      order.handled == true
    end
  end
end
