class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    @product.image.attach(params[:product][:image])
    if @product.save
      redirect_to '/'
    else
      flash[:danger] = "There was an error creating your dish!"
      render 'new'
    end
  end

  private
  def product_params
    params.require(:product).permit( :name,:description,:price,:image)
  end
end
