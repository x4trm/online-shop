class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :cart_items, dependent: :destroy
  has_many :books, through: :cart_items

  def add_book(book)
    item = cart_items.find_or_initialize_by(book: book)
    item.quantity ||= 0
    item.quantity += 1
    item.save
  end

  def remove_book(book)
    item = cart_items.find_by(book: book)
    if item
      item.quantity -= 1
      item.save
      item.destroy if item.quantity <= 0
    end
  end

  def total_price
    cart_items.joins(:book).sum('cart_items.quantity * books.price')
  end
end
