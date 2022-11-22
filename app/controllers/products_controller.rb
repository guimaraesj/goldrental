class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]

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
      redirect_to products_path(@product) #ver no rails routes para onde direcionar
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit([:name, :description, :min_rent_duration, :weight, :material, :product_price, :rent_cost, :city, :state])
  end
end
