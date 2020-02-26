class SmsService
  def self.send_message(user, message)
    client = Twilio::REST::Client.new
    client.messages.create({
      from: Rails.application.credentials.twilio[Rails.env.to_sym][:phone_number],
      to: user.phone_number,
      body: message
    })
  end
end
