class Payment < ApplicationRecord
  belongs_to :conference
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
      payment_method_types: ['card'],
      line_items: [{
        name: conference.title,
        description: conference.description,
        images: [conference.image_url],
        amount: final_amount * 100,
        currency: 'inr',
        quantity: quantity
      }],
      success_url: 'https://ticketmedium.com/payment_confirmation/success?sessionId={CHECKOUT_SESSION_ID}',
      cancel_url: 'https://ticketmedium.com/payment_confirmation/cancel?sessionId={CHECKOUT_SESSION_ID}',
    )
    update_attributes(
      discounted_amount: discounted_amount,
      final_amount: final_amount,
      session_id: session.id
    )
    { id: session.id, publishable_key: PUBLISHABLE_API_KEY }
  end

  def confirm
    # TODO: Implement features to validate if the session id is actually successful in Stripe.
    'success'
  end
end
