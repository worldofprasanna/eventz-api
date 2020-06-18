class AddEventLinkToConference < ActiveRecord::Migration[6.0]
  def change
    add_column :conferences, :event_link, :string, null: true
  end
end
