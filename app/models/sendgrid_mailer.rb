class SendgridMailer
  include SendGrid

  TEMPLATE_IDS = {
    'USER_REGISTRATION': 'd-ad8a5da1b94e4b358aa770019477746f',
    'PAYMENT_CONFIRMATION': 'd-ad8a5da1b94e4b358aa770019477746f'
  }

  def self.send(to, template)
    mail = Mail.new
    mail.from = Email.new(email: 'no-reply@ticketmedium.com')
    personalization = Personalization.new
    personalization.add_to(Email.new(email: to))
    personalization.add_dynamic_template_data({
        "username" => "Prasanna V"
    })
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