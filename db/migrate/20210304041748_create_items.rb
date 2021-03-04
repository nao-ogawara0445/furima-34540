class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string  :item_name 
      t.text    :item_exposition
      t.integer :category_id 
      t.integer :status_id
      t.integer :postage_id 
      t.integer :shipping_id
      t.integer :price  
      t.integer :day_id 
      t.references :user ,foreign_key: true
    end
  end
end
