class CreatePayment < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.string :session_id
      t.integer :conference_id
      t.float :discounted_amount
      t.float :final_amount
      t.string :promocode
      t.integer :quantity
    end
  end
end
