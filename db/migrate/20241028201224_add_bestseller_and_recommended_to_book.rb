class AddBestsellerAndRecommendedToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :bestseller, :boolean, default: false
    add_column :books, :recommended, :boolean, default: false
  end
end
