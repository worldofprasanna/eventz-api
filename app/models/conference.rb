class Conference < ApplicationRecord
  has_many :talks, dependent: :destroy

  def total_talks
    talks.count
  end

  def speakers
    talks.map(&:speaker)
  end

  def discount_amount(promocode)
    result = PromoCode.validate(promocode)
    discount_percentage = result[:discount] / 100
    price * discount_percentage
  end

  def final_amount(promocode)
    (price - discount_amount(promocode)).round
  end
end
