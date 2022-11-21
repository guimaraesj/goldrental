class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]

  def index
    @products = Product.all
  end
end
