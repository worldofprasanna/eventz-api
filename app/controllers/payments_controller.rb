class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def checkout_session
    payment = Payment.new(checkout_params)
    payment.user = current_user
    if payment.save
      render json: payment.stripe_checkout_session
    else
      render json: { msg: 'Please try again later' }, status: 500
    end
  end

  def confirm
    session_id = params[:session_id]
    payment = Payment.find_by(session_id: session_id)
    render json: { status: payment.status }
  end

  def confirmation_from_payment_gateway
    status = Payment.stripe_confirmation(confirmation_params)
    render json: { msg: 'Processed' }, status: status
  end

  private

  def checkout_params
    params.permit(:conference_id, :promocode, :quantity)
  end

  def confirmation_params
    params.permit!
  end
end
