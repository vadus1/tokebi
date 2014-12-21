class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.references :shipping_rate, index: true

      t.timestamps null: false
    end
    add_foreign_key :countries, :shipping_rates
  end
end
