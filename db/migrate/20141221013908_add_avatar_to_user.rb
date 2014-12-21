class AddAvatarToUser < ActiveRecord::Migration
  def change
    add_column :users, :biography, :text
    add_column :users, :avatar, :string
  end
end
