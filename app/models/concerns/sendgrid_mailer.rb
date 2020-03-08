class SendgridMailer
  include SendGrid

  TEMPLATE_IDS = {
    'USER_CONFIRMATION': 'd-474c46a07d4040ea812202f4aaaf7ffd',
    'USER_REGISTRATION': 'd-ad8a5da1b94e4b358aa770019477746f',
    'PAYMENT_CONFIRMATION': 'd-d8be73c1dd2b43f29348d5a77b79416d'
  }

  def self.send(email, template, data={})
    mail = Mail.new
    mail.from = Email.new(email: 'no-reply@ticketmedium.com')
    personalization = Personalization.new
    personalization.add_to(Email.new(email: email))
    personalization.add_dynamic_template_data(data)
    mail.add_personalization(personalization)
    mail.template_id = TEMPLATE_IDS[template]
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    begin
      response = sg.client.mail._("send").post(request_body: mail.to_json)
      return response.status_code
    rescue StandardError => e
      puts e.message
    end
  end
end