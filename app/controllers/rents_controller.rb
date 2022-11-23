class RentsController < ApplicationController
  before_action :set_rent, only: %i[show edit update destroy]

  def index
    @rents = Rent.where(user: current_user)
    # @rents = Rent.all
  end

  def show
  end

  def new
    @product = Product.find(params[:product_id])
    @rent = Rent.new
  end

  def create
    @product = Product.find(params[:product_id])
    @rent = Rent.new(rent_params)
    @rent.user = current_user
    @rent.product = @product
    if @rent.save
      redirect_to rents_path(@rent)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    @rent = Rent.find(params[:id])
  end

  def update
    # @product.update(product_params)
    # redirect_to product_path(@product)
    # @product = Product.find(params[:product_id])
    @rent.update(rent_params)
    @rent.product = @product
    redirect_to rents_path(@rent)
    # if @rent.update(rent_params)
    #   redirect_to rents_path(@rent)
    # else
    #   render :new, status: :unprocessable_entity
    # end
  end

  def destroy
    @rent.destroy
    redirect_to rents_path, status: :see_other
  end

  private

  def rent_params
    params.require(:rent).permit(:total_value, :duration, :approval_state, :credit_card)
  end

  def set_rent
    @rent = Rent.find(params[:id])
  end
end
