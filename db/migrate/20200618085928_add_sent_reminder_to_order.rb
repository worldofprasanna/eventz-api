class AddSentReminderToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :sent_reminder, :boolean, default: false
  end
end
