class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.interger :customer_id
      t.interger :item_id
      t.interger :amount
      t.timestamps
    end
  end
end
