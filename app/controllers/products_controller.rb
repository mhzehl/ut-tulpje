class ProductsController < ApplicationController
  # before_action :set_product, only: [:show, :edit, :update]
  # before_action :authenticate_user!, except: [:show]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: "Product successfully created"
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])

    @product.destroy

    redirect_to @product
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :image_url, :availability, :price, :department_id)
  end
end
