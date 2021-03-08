class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|

      t.timestamps
      t.references :user ,null: false, polymorphic: true
      t.references :item ,null: false, polymorphic: true
    end
  end
end
