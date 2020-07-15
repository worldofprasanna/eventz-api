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
    { id: order.id, razorpay_key: RAZORPAY_KEY, final_amount: final_amount }
  end

  def create_free_order
    update_attributes(
      final_amount: 0.0,
      status: 'SUCCESSFUL',
      confirmation_token: SecureRandom.uuid
    )
    { id: self.id, status: self.status, final_amount: self.final_amount }
  end

  def verify_razorpay_order(order_id, payment_id, signature)
    payment_hash = {
      :razorpay_order_id   => order_id,
      :razorpay_payment_id => payment_id,
      :razorpay_signature  => signature
    }
    response = Razorpay::Utility.verify_payment_signature(payment_hash)
    if response
      result = Razorpay::Payment.fetch(payment_id).capture({ amount: final_amount.to_i * 100 })
      if result.status == 'captured'
        update_attributes(status: 'SUCCESSFUL', confirmation_token: SecureRandom.uuid)
        return 200
      else
        update_attributes(status: 'NOT_CAPTURED_PROPERLY')
        return 500
      end
    else
      update_attributes(status: 'NOT_VALID_SIGNATURE')
      return 400
    end
  end

  def conference_data
    data = {
      'receiver_name': self.full_name,
      'event_name': self.conference.title,
      'event_time': self.conference.start_date.strftime("%d, %b %Y %I:%M%P") + " IST"
    }
  end
end
