class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]
  before_action :set_product, only: %i[show edit update destroy]
  def index
    @products = Product.all

    ## CODE BELOW IS TO BE IMPLEMENTED to replace above line. Need to change product schema to add these dates.
    # user_start_date = params[:start_date]
    # user_end_date = params[:endgit _date]

    # sc_1 = "end_date < ?"
    # sc_2 = "start_date > ? AND end_date < ?"
    # sc_3 = "start_date > ?"

    # conflicting_bookings = Rent.where("#{sc_1} OR #{sc_2} OR #{sc_3}, params[user_end_date, user_start_date, user_end_date, user_start_date ]")
    # occuped_products = conflicting_bookings.map { |rent| rent.product }
    # @products = Product.all - occuped_products
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
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  def destroy
    # raise
    @product.destroy
    redirect_to products_path, status: :see_other
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :min_rent_duration, :material, :rent_cost, :city, :state, :photo)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
