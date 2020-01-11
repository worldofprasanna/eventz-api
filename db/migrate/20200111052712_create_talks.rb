class CreateTalks < ActiveRecord::Migration[6.0]
  def change
    create_table :talks do |t|
      t.string :title
      t.timestamp :start_time
      t.string :description
      t.references :speaker, null: false, foreign_key: true
      t.references :conference, null: false, foreign_key: true
      t.string :talk_type

      t.timestamps
    end
  end
end
