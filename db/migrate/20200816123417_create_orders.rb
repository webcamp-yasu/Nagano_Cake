class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :postage, default: 800
      t.integer :billing_amount
      t.integer :payment_method, default: 0
      t.string :postal_code
      t.string :address
      t.string :address_name
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
