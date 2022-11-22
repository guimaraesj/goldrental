class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

end
