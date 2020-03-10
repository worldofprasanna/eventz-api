class AddConfirmationTokenToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :confirmation_token, :string
    add_index :orders, :confirmation_token
  end
end
