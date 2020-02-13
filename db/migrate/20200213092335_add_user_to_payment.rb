class AddUserToPayment < ActiveRecord::Migration[6.0]
  def change
    add_reference :payments, :user, foreign_key: true
  end
end
