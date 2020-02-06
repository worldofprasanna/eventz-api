class PromoCodeController < ApplicationController

  def apply_discount
    code = discount_params
    msg = PromoCode.validate(code)
    render json: msg
  end

  private

  def discount_params
    params[:code]
  end
end
