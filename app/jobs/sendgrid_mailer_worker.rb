class SendgridMailerWorker
  include Sidekiq::Worker
  sidekiq_options queue: :notification, retry: 3

  def perform(email, template, data={})
    result = SendgridMailer.send(email, template.to_sym, data)
    p "status code for sending mail - #{result}"
  end
end