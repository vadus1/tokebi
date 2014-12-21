class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :phone
      t.references :user, index: true
      t.boolean :default
      t.references :country, index: true

      t.timestamps null: false
    end
    add_foreign_key :addresses, :users
    add_foreign_key :addresses, :countries
  end
end
