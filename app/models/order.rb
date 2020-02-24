class Order < ApplicationRecord
  belongs_to :conference, optional: true
  belongs_to :user, optional: true
  belongs_to :ticket_price, optional: true

  RAZORPAY_KEY = Rails.application.credentials.razorpay[Rails.env.to_sym][:key]

  def create_razorpay_order
    discounted_amount = ticket_price.discount_amount(promocode, quantity)
    final_amount = ticket_price.final_amount(promocode, quantity)
    order = Razorpay::Order.create amount: final_amount * 100, currency: 'INR', receipt: conference.title
    update_attributes(
      razorpay_order_id: order.id,
      discounted_amount: discounted_amount,
      final_amount: final_amount,
      status: 'IN_PROGRESS'
    )
    { id: order.id, razorpay_key: RAZORPAY_KEY }
  end
end
