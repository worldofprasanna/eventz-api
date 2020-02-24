class Conference < ApplicationRecord
  has_many :talks, dependent: :destroy
  has_many :ticket_prices, dependent: :destroy
  accepts_nested_attributes_for :ticket_prices
  has_and_belongs_to_many :speakers

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

  def talk_speakers
    talks.map(&:speaker)
  end


end
