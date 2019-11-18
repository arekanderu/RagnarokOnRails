class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :order_number
      t.references :customer, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :sub_total
      t.decimal :tax_rate
      t.decimal :total_price

      t.timestamps
    end
  end
end
