class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :product, index: true
      t.references :order, index: true
      t.integer :quantity, default: 0, null: false
      t.decimal :sub_total,  default: 0.0

      t.timestamps null: false
    end
    add_foreign_key :items, :products
    add_foreign_key :items, :orders
  end
end
