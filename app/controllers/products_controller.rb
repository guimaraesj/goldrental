class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
  end

  # private

  # def set_product
  #   @product = Product.find(params[:id])
  # end

end
