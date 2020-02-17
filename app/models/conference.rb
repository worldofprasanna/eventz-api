class Conference < ApplicationRecord
  has_many :talks, dependent: :destroy
  has_many :ticket_prices, dependent: :destroy
  accepts_nested_attributes_for :ticket_prices

  def total_talks
    talks.count
  end

  def prices
    ticket_prices.map do |obj|
      {
        'type': obj.ticket_type,
        'price': obj.price
      }
    end
  end

  def speakers
    talks.map(&:speaker)
  end

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
