class CreateSendings < ActiveRecord::Migration[6.0]
  def change
    create_table :sendings do |t|
      t.string  :postal_code,null: false
      t.integer :postage_id,null: false
      t.string  :town ,null: false
      t.string  :address ,null: false
      t.string   :building
      t.string :tel,null: false
      t.references :purchase,null: false,foreign_key: true
      t.timestamps
    end
  end
end
