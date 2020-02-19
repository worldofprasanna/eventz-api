class User < ApplicationRecord
  include Clearance::User

  def active?
    is_active
  end
end
