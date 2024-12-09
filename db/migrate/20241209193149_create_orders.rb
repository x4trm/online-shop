class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :pay_type
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
