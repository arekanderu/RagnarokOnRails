class CreateOrderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :order_details do |t|
      t.reference :order
      t.reference :product

      t.timestamps
    end
  end
end