class PaymentsController < ApplicationController
  def show
    @payment = Payment.includes(:user, [:utilities], :utility_payments).find(params[:id])
  end

  def new; end

  def create
    @payment = Payment.new(payment_params)
    if @payment.save
      redirect_to user_utility_path(user_id: current_user.id, id: params[:id]),
                  notice: 'Payment was successfully created'

    else
      render :new, alert: 'Payment could not be created'
    end
  end

  def payment_params
    params.require(:payment).permit(:name, :amount)
  end
end
