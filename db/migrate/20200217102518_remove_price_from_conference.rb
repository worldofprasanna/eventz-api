class RemovePriceFromConference < ActiveRecord::Migration[6.0]
  def change
    remove_column :conferences, :price, :decimal
  end
end
