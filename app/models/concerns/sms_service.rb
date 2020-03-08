class SmsService
  def self.send_message(mobile_number, message)
    client = Twilio::REST::Client.new
    client.messages.create({
      from: Rails.application.credentials.twilio[Rails.env.to_sym][:phone_number],
      to: mobile_number,
      body: message
    })
  end
end
