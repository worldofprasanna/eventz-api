class Conference < ApplicationRecord
  has_many :talks, dependent: :destroy
  has_many :ticket_prices, dependent: :destroy
  has_many :orders

  accepts_nested_attributes_for :ticket_prices
  has_and_belongs_to_many :speakers

  # before_create :set_slug

  def total_talks
    talks.count
  end

  def set_slug
    update_attribute(:slug, to_slug(title)) if slug.blank?
  end

  def participants
    orders.all.pluck(:full_name)
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

  def send_reminders
    self.orders.each do |order|
      if order.status == 'SUCCESSFUL' && !order.sent_reminder
        data = conference_data(order)
        SendgridMailer.send(order.email_id, :EVENT_REMINDER, data)
        order.update(sent_reminder: true)
      end
    end
  end

  def conference_data(order)
    data = {
      'receiver_name': order.full_name,
      'event_name': self.title,
      'event_time': self.start_date.strftime("%d, %b %Y %I:%M%P %Z"),
      'event_link': self.event_link
    }
  end
end
