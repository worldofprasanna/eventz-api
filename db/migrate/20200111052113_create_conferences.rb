class CreateConferences < ActiveRecord::Migration[6.0]
  def change
    create_table :conferences do |t|
      t.string :title
      t.string :location
      t.string :description
      t.string :image_url
      t.timestamp :start_date

      t.timestamps
    end
  end
end
