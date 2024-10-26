class Book < ApplicationRecord
  belongs_to :category
  has_many :author_books
  has_many :authors, through: :author_books

  validates :name, :description, :page_count, :contents, presence: true
  validates :page_count, numericality: { only_integer: true, greater_than: 0 }
end
