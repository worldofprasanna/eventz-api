class Payment < ApplicationRecord
  belongs_to :conference
  belongs_to :user

  STRIPE_API_KEY = Rails.application.credentials.stripe[Rails.env.to_sym][:secret_key]
  PUBLISHABLE_API_KEY = Rails.application.credentials.stripe[Rails.env.to_sym][:publishable_key]

  def stripe_checkout_session
    Stripe.api_key = STRIPE_API_KEY
    discounted_amount = conference.discount_amount(promocode, quantity)
    final_amount = conference.final_amount(promocode, quantity)

    session = Stripe::Checkout::Session.create(
      payment_intent_data: {
        setup_future_usage: 'off_session'
      },
      client_reference_id: user.id,
      payment_method_types: ['card'],
      line_items: [{
        name: conference.title,
        description: conference.description,
        images: [conference.image_url],
        amount: final_amount * 100,
        currency: 'inr',
        quantity: 1
      }],
      success_url: 'https://ticketmedium.com/payment_confirmation/success?sessionId={CHECKOUT_SESSION_ID}',
      cancel_url: 'https://ticketmedium.com/payment_confirmation/cancel?sessionId={CHECKOUT_SESSION_ID}',
    )
    update_attributes(
      discounted_amount: discounted_amount,
      final_amount: final_amount,
      session_id: session.id,
      status: 'IN_PROGRESS'
    )
    { id: session.id, publishable_key: PUBLISHABLE_API_KEY }
  end

  def self.stripe_confirmation(request_body)
    session_id = request_body.dig('data', 'object', 'id')
    display_items = request_body.dig('data', 'object', 'display_items')
    return 400 if display_items.count <= 0

    amount = display_items[0]['amount'] / 100
    payment = Payment.find_by(session_id: session_id)
    if payment.final_amount == amount
      payment.update_attributes(status: 'SUCCESSFUL')
      return 200
    else
      payment.update_attributes(status: 'AMOUNT_MISMATCH')
      return 400
    end
  end
end
