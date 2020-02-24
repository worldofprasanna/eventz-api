class TicketPrice < ApplicationRecord
  belongs_to :conference

  def discount_amount(promocode, quantity)
    result = PromoCode.validate(promocode)
    discount_percentage = result[:discount] / 100
    actual_price(quantity) * discount_percentage
  end

  def actual_price(quantity)
    price * quantity
  end

  def final_amount(promocode, quantity)
    (actual_price(quantity) - discount_amount(promocode, quantity)).round
  end
end
