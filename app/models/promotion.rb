class Promotion < ApplicationRecord
  has_one_attached :image
  validates :image, presence: true

  scope :active, -> { where(active: true)}
end
