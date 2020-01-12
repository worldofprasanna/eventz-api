class AddSummaryToSpeaker < ActiveRecord::Migration[6.0]
  def change
    add_column :speakers, :speaker_summary, :string
    add_column :speakers, :birthday, :datetime
    add_column :speakers, :country, :string
    add_column :speakers, :city, :string
    add_column :speakers, :about_page, :string
    add_column :speakers, :languages_known, :string, array: true, default: []
    add_column :speakers, :mobile_number, :string
    add_column :speakers, :email, :string
  end
end
