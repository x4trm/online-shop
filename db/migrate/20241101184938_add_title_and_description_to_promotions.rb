class AddTitleAndDescriptionToPromotions < ActiveRecord::Migration[7.0]
  def change
    add_column :promotions, :title, :string
    add_column :promotions, :description, :text
  end
end
