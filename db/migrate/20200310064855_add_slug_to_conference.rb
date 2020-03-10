class AddSlugToConference < ActiveRecord::Migration[6.0]
  def change
    add_column :conferences, :slug, :string
    add_index :conferences, :slug, unique: true
  end
end
