class RentsController < ApplicationController
  before_action :set_rent, only: %i[new create]
  def index
    @rents = Rent.where(user: current_user)
  end

  def show
    @rent = Rent.find(params[:id])
  end

  def new
    @rent = Rent.new
  end

  def create
    @rent = Rent.new(rent_params)
    @rent.user = current_user
    if @rent.save
      redirect_to rents_path(@rent)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @rent = Rent.find(params[:id])
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
