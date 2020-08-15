class OrderItemsController < ApplicationController

  def create
    @cart = current_user.cart
    @product =  Product.find(params[:id])
    @order_item = OrderItem.new(cart: @cart,product: @product)
    @order_item.quantity = 0
    if OrderItem.find_by(cart: @cart, product: @product) == nil
      if @order_item.save
        flash[:success] = "Item added to cart"
      else
        flash[:danger] = "There was an error adding this item to the cart"
      end
    else
      @order_item.update(quantity: @order_item.quantity + 1)
    end
    redirect_to cart_url
  end

  def destroy
    OrderItem.find(params[:id]).destroy
    flash[:success] = "Item deleted"
  end


  private

  def order_params
    params.require(:order_item).permit(:product_id, :quantity)
  end
end
