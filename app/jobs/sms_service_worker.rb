class SmsServiceWorker
  include Sidekiq::Worker
  sidekiq_options queue: :notification, retry: 3

  def perform(mobile_number, message)
    SmsService.send_message(mobile_number, message)
  end
end