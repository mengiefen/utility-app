class PaymentsController < ApplicationController
  def show
    @utility = Utility.find(params[:utility_id])
    @payment = @utility.payments.find(params[:id])
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = current_user.payments.new(payment_params)
    if @payment.save
      redirect_to root_path,
                  notice: 'Payment was successfully created'
    else
      render :new, alert: 'Payment could not be created'
    end
  end

  def payment_params
    params.require(:payment).permit(:name, :amount, utility_ids: [])
  end
end
