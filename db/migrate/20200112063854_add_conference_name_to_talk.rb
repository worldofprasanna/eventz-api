class AddConferenceNameToTalk < ActiveRecord::Migration[6.0]
  def change
    add_column :talks, :conference_name, :string
    add_column :talks, :speaker_name, :string
    change_column_null :talks, :conference_id, true
    change_column_null :talks, :speaker_id, true
  end
end
