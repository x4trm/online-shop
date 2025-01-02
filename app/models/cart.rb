class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :cart_items, dependent: :destroy
  has_many :books, through: :cart_items

  def add_book(book)
    current_item = cart_items.find_by(book_id: book.id)
    if current_item
      current_item.increment(:quantity)
    else
      current_item = cart_items.build(book_id: book.id, quantity: 1)
    end
    current_item.save
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
    cart_items.includes(:book).inject(0) do |sum, item|
      sum + item.quantity * item.book.price
    end
  end
end
