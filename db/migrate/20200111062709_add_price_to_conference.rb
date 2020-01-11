class AddPriceToConference < ActiveRecord::Migration[6.0]
  def change
    add_column :conferences, :price, :decimal
    add_column :conferences, :duration, :string
  end
end
