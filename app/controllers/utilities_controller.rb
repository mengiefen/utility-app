class UtilitiesController < ApplicationController
  def index
    @utilities = Utility.all
  end

  def new
    @utility = Utility.new
  end

  def show
    @utility = Utility.includes(:utility_payments, :payments).find(params[:id])
    @payments = @utility.payments.all
  end

  def create
    @utility = current_user.utilities.create!(utility_params)
    if @utility.save
      redirect_to user_utilities_path(user_id: current_user.id), notic: 'Utility Item Saved Successfully'
    else
      rended :new, alert: "Couldn't save the utility"
    end
  end

  def utility_params
    params.require(:utility).permit(:name, :icon)
  end
end
