class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.interger :customer_id
      t.string :postal_code
      t.string :address
      t.string :name
      t.interger :shipping_cost
      t.interger :total_payment
      t.interger :payment_method
      t.interger :stats
      t.timestamps
    end
  end
end
