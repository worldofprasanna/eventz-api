class CreateJoinTableConferencesSpeakers < ActiveRecord::Migration[6.0]
  def change
    create_join_table :conferences, :speakers do |t|
      # t.index [:conference_id, :speaker_id]
      # t.index [:speaker_id, :conference_id]
    end
  end
end
