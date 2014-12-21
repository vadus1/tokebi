class CreateShippingRates < ActiveRecord::Migration
  def change
    create_table :shipping_rates do |t|
      t.string :name
      t.decimal :rate, default: 0.0

      t.timestamps null: false
    end
  end
end
