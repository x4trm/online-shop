class Order < ApplicationRecord
  belongs_to :cart

  validates :name, :address, :email, :pay_type, presence: true
end
