class CreateSpeakers < ActiveRecord::Migration[6.0]
  def change
    create_table :speakers do |t|
      t.string :name
      t.string :role
      t.string :linkedin_handle
      t.string :twitter_handle
      t.string :github_handle
      t.string :company
      t.string :company_logo
      t.string :profile_pic

      t.timestamps
    end
  end
end
