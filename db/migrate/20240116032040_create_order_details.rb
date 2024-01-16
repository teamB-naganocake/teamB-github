class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.interger :order_id
      t.interger :item_id
      t.interger :price
      t.interger :amount
      t.interger :making_stats
      t.timestamps
    end
  end
end
