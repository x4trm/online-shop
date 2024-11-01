class AddSlugToCategoriesAndBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :slug, :string
    add_index :categories, :slug, unique: true
    add_column :books, :slug, :string
    add_index :books, :slug, unique: true
  end
end
