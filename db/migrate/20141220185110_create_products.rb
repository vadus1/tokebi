class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name,         null: false
      t.text :description,    null: false
      t.decimal :price,       null: false, precision: 8, scale: 2
      t.references :category, index: true

      t.timestamps null: false
    end
    add_foreign_key :products, :categories
  end
end
