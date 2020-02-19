class User < ApplicationRecord
  include Clearance::User

  def confirmed?
    is_confirm
  end

  def confirm
    self.is_confirm = true
    self.confirmed_at = Time.current
    save
  end
end
