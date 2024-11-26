class CartsController < ApplicationController
  before_action :set_cart

  def show
  end

  def add_to_cart
    book = Book.find(params[:book_id])
    @cart.add_book(book)
    redirect_to cart_path, notice: "#{book.name} został dodany do koszyka."
  end

  def remove_from_cart
    book = Book.find(params[:book_id])
    @cart.remove_book(book)
    redirect_to cart_path, notice: "#{book.name} został usunięty z koszyka."
  end

  private

  def set_cart
    if user_signed_in?
      @cart = Cart.find_or_create_by(user_id: current_user.id)
    else
      @cart = Cart.find_or_create_by(id: session[:cart_id], user_id: nil)
      session[:cart_id] = @cart.id
    end
  end
end
