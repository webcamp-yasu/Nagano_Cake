class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :postage
      t.integer :billing_amount, default: 800
      t.integer :payment_method
      t.string :postal_code
      t.string :address
      t.string :address_name
      t.integer :status

      t.timestamps
    end
  end
end
