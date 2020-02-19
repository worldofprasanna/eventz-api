class UpdateColumnNameInUser < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :is_active, :is_confirm
    add_column :users, :confirmed_at, :string
  end
end
