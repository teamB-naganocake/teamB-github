class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.interger :genre_id
      t.string :name
      t.text :introduction
      t.interger :price
      t.boolean :is_active
      t.timestamps
    end
  end
end
