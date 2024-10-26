class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.text :description
      t.integer :page_count
      t.text :contents
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
