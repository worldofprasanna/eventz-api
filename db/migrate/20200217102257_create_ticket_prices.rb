class CreateTicketPrices < ActiveRecord::Migration[6.0]
  def change
    create_table :ticket_prices do |t|
      t.float :price
      t.references :conference, null: false, foreign_key: true
      t.string :ticket_type

      t.timestamps
    end
  end
end
