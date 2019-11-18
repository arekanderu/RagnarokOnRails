class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.references :province, null: false, foreign_key: true
      t.string :address
      t.string :city
      t.string :postal_code
      t.string :email_address
      t.integer :credit_card_number
      t.string :phone_number

      t.timestamps
    end
  end
end
