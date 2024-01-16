class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :first_name_kana
      t.string :last_name_kana
      t.interger :postal_code
      t.string :address
      t.interger :telephone_number
      t.boolean :is_active
      t.timestamps
    end
  end
end
