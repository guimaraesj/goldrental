class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]
  before_action :set_product, only: %i[show edit update destroy]

  def index
    # @products = Product.all -
    @products = policy_scope(Product) # to allow for later show of the owner products page.

    ## CODE BELOW IS TO BE IMPLEMENTED to replace above line. Need to change product schema to add these dates.
    # user_start_date = params[:start_date]
    # user_end_date = params[:endgit _date]

    # sc_1 = "end_date < ?"
    # sc_2 = "start_date > ? AND end_date < ?"
    # sc_3 = "start_date > ?"

    # conflicting_bookings = Rent.where("#{sc_1} OR #{sc_2} OR #{sc_3}, params[user_end_date, user_start_date, user_end_date, user_start_date ]")
    # occuped_products = conflicting_bookings.map { |rent| rent.product }
    # @products = Product.all - occuped_products
  end

  def new
    @product = Product.new
    authorize @product # pundit authorization to anyone
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    authorize @product # pundit authorization to anyone
    if @product.save
      redirect_to products_path(@product)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    authorize @product # pundit authorization to anyone
  end

  def edit
    authorize @product # pundit authorization to owner (see policy)
  end

  def update
    authorize @product # pundit authorization to owner (see policy)
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  def destroy
    authorize @product # pundit authorization to owner (see policy)
    @product.destroy
    redirect_to products_path, status: :see_other
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :min_rent_duration, :weight, :material, :rent_cost, :product_price, :city, :state, :photo)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
