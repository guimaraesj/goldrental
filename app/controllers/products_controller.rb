class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]
  before_action :set_product, only: %i[show edit]
  def index
    @products = Product.all
    #link to
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to products_path(@product)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :min_rent_duration, :material, :rent_cost, :city, :state)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
