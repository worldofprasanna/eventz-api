class AddFieldsToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :email_id, :string
    add_column :orders, :full_name, :string
    add_column :orders, :mobile_number, :string
    change_column :orders, :promocode, :string
  end
end
