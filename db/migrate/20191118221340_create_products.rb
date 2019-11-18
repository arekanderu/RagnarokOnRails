class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.references :category, null: false, foreign_key: true
      t.integer :number_in_stock
      t.integer :attack
      t.integer :magic_attack
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
