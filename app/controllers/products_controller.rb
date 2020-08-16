class ProductsController < ApplicationController
  before_action :admin_user, only: [:destroy, :show, :create, :new, :edit, :update]

  def index
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.all
  end

  def create
    @product = Product.new(product_params)
    @product.image.attach(params[:product][:image])
    if @product.save
      redirect_to '/adminproducts'
    else
      flash[:danger] = "There was an error creating your dish!"
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def destroy
    Product.find(params[:id]).destroy
    redirect_to '/adminproducts'
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:success] = "Item updated"
      redirect_to '/adminproducts'
    else
      render 'edit'
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
