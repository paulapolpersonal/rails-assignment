class OrderItemsController < ApplicationController
  def create
    @cart = Cart.find_or_create_by!(user_id: current_user.id)
    @product = Product.find(params[:id])
    @order_item = OrderItem.find_by(cart: @cart, product: @product)
    if @order_item.nil?
      @order_item = OrderItem.new(cart: @cart, product: @product, quantity: 1)
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

  def update
    @order_item = OrderItem.find(params[:id])
    @quantity = params[:quantity]
    @order_item.update(quantity: @quantity)
    redirect_to cart_url
  end

  def destroy
    OrderItem.find(params[:id]).destroy
    flash[:success] = "Item deleted"
    redirect_to '/cart'
  end

  private

  def order_params
    params.require(:order_item).permit(:product_id, :quantity)
  end
end
