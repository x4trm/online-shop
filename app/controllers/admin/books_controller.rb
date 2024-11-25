module Admin
  class BooksController < ApplicationController
    before_action :authenticate_user!
    before_action :admin_only
    before_action :set_book, only: [:edit, :update, :destroy]

    def index
      @books = Book.all
    end

    def new
      @book = Book.new
    end

    def create
      @book = Book.new(book_params)
      if @book.save
        redirect_to admin_books_path, notice: "Book created successfully."
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @book.update(book_params)
        redirect_to admin_books_path, notice: "Book updated successfully."
      else
        render :edit
      end
    end

    def destroy
      @book.destroy
      redirect_to admin_books_path, notice: "Book deleted successfully."
    end

    private

    def admin_only
      redirect_to root_path, alert: "Access denied." unless current_user.admin?
    end

    def set_book
      @book = Book.find_by(slug: params[:slug])
    end

    def book_params
      params.require(:book).permit(:name, :description, :page_count, :contents, :category_id, :price, :slug, :recommended, :bestseller, author_ids: [])
    end
  end
end
