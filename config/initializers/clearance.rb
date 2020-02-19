Clearance.configure do |config|
  config.mailer_sender = "no-reply@ticketmedium.com"
  config.rotate_csrf_on_sign_in = true
  config.routes = false
  config.user_model = User
  config.password_strategy = Clearance::PasswordStrategies::BCrypt
  config.cookie_expiration = lambda { |cookies| (ENV['TIMEOUT_HOUR'].to_i == 0 ? 24 : ENV['TIMEOUT_HOUR'].to_i).hour.from_now.utc }
  config.sign_in_guards = [LoginActiveGuard]
end
