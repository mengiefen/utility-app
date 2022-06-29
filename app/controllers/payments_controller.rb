class PaymentsController < ApplicationController
  def show
    @utility = Utility.find(params[:utility_id])
    @payment = @utility.payments.find(params[:id])
    # @payments = Payment.includes(:user, [:utilities], :utility_payments).find(params[:id])
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = current_user.payments.new(name: payment_params[:name], amount: payment_params[:amount])

    if @payment.save
      @payment.utility_payments.create!(utility_id: payment_params[:utility_id])
      redirect_to user_utility_path(user_id: params[:user_id], id: payment_params[:utility_id]),
                  notice: 'Payment was successfully created'

    else
      render :new, alert: 'Payment could not be created'
    end
  end

  def payment_params
    params.require(:payment).permit(:name, :amount, :utility_id)
  end
end
