class Category < ApplicationRecord
  has_many :books, dependent: :destroy
  before_save :generate_slug

  def to_param
    slug
  end

  private

  def generate_slug
    self.slug ||= name.parameterize
  end
end
