class Conference < ApplicationRecord
  has_many :talks, dependent: :destroy

  def total_talks
    talks.count
  end

  def speakers
    talks.map(&:speaker)
  end
end
