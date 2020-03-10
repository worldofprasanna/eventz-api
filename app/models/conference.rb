class Conference < ApplicationRecord
  has_many :talks, dependent: :destroy
  has_many :ticket_prices, dependent: :destroy
  accepts_nested_attributes_for :ticket_prices
  has_and_belongs_to_many :speakers

  before_create :set_slug

  def total_talks
    talks.count
  end

  def set_slug
    update_attribute(:slug, to_slug(title)) if slug.blank?
  end

  def to_slug(string)
    string.parameterize.truncate(20, omission: '')
  end

  def to_param
    slug
  end

  def self.create_slugs
    Conference.all.each do |conference|
      conference.set_slug
    end
  end

  def prices
    ticket_prices.map do |obj|
      {
        'type': obj.ticket_type,
        'price': obj.price,
        'id': obj.id
      }
    end
  end

  def talk_speakers
    talks.map(&:speaker)
  end


end
