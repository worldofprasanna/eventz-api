class User < ApplicationRecord
  include Clearance::User

  def confirmed?
    is_confirm
  end

  def confirm(token)
    if token == confirmation_token
      self.is_confirm = true
      self.confirmed_at = Time.current
      save
      true
    else
      false
    end
  end
end
