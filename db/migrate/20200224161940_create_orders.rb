class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :razorpay_order_id
      t.decimal :final_amount
      t.decimal :discounted_amount
      t.decimal :discounted_percentage
      t.decimal :promocode
      t.integer :quantity
      t.string :status
      t.references :conference, null: false, foreign_key: true
      t.references :ticket_price, null: false, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
