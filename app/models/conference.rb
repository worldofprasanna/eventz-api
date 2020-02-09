class Conference < ApplicationRecord
  has_many :talks, dependent: :destroy

  def total_talks
    talks.count
  end

  def speakers
    talks.map(&:speaker)
  end

  def discount_amount(promocode)
    100
  end

  def final_amount(promocode)
    (price - 100).round
  end
end
