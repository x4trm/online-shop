class Promotion < ApplicationRecord
  has_one_attached :image
  validates :title, presence: true
  validates :description, presence: true
  validates :image, presence: true

  scope :active, -> { where(active: true) }
end
