class RentsController < ApplicationController
  before_action :set_rent, only: %i[new create show]
  def index
    #@rents = Rent.where(user: current_user)
    @rents = policy_scope(Rent)
  end

  def show
    authorize @rent # pundit authorization to what is defined in rents policy
  end

  def new
    @rent = Rent.new
    authorize @rent # pundit authorization to what is defined in rents policy
  end

  def create
    @rent = Rent.new(rent_params)
    @rent.user = current_user
    authorize @rent # pundit authorization to what is defined in rents policy
    if @rent.save
      redirect_to rents_path(@rent)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @rent # pundit authorization to what is defined in rents policy
  end

  def update
    authorize @rent # pundit authorization to what is defined in rents policy
  end

  def destroy
    authorize @rent # pundit authorization to what is defined in rents policy
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
