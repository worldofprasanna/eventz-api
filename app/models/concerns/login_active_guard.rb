# frozen_string_literal: true

class LoginActiveGuard < Clearance::SignInGuard
  def call
    if signed_in? && current_user.confirmed?
      next_guard
    else
      failure('Your account is not yet activated! Please check your email.')
    end
  end
end
