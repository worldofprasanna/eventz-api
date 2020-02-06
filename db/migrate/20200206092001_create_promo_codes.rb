class CreatePromoCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :promo_codes do |t|
      t.string :name
      t.string :code
      t.float :discount

      t.timestamps
    end
  end
end
