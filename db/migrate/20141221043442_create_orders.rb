class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :token
      t.string :state
      t.references :address, index: true
      t.integer :items_count, default: 0
      t.decimal :total, default: 0.0
      t.decimal :balance, default: 0.0

      t.timestamps null: false
    end
    add_foreign_key :orders, :addresses
  end
end
