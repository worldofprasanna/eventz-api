class PaymentsController < ApplicationController
  def checkout_session
    payment = Payment.new(checkout_params)
    if payment.save
      render json: payment.stripe_checkout_session
    else
      render json: { msg: 'Please try again later' }, status: 500
    end
  end

  def confirm
    session_id = params[:session_id]
    payment = Payment.find_by(session_id: session_id)
    render json: { status: payment.confirm }
  end

  private

  def checkout_params
    params.permit(:conference_id, :promocode, :quantity)
  end
end
