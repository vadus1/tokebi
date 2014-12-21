class AddSlugToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :slug, :string, uniq: true, null: false
  end
end
