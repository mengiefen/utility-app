class UtilitiesController < ApplicationController
  def index
    @utilities = Utility.includes(:utility_payments).all
  end

  def new
    @utility = Utility.new
  end

  def show
    @utility = Utility.find(params[:id])
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
