class Admin::ProductsController < AdminController
  def index
    @product = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    @product.image.attach(params[:product][:image])
    if @product.save
      redirect_to admin_products_path
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
    redirect_to admin_products_path
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:success] = "Item updated"
      redirect_to admin_product_path
    else
      render 'edit'
    end
  end

  private

    def product_params
      params.require(:product).permit(:name, :description, :price, :image)
    end
end
