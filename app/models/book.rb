class Book < ApplicationRecord
  belongs_to :category
  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books

  has_one_attached :image

  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :name, :description, :page_count, :contents, presence: true
  validates :page_count, numericality: { only_integer: true, greater_than: 0 }

  before_save :generate_slug

  def to_param
    slug
  end

  private

  def generate_slug
    self.slug ||= name.parameterize
  end
end
