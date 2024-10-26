class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.include(:authors, :category).all
  end

  def show
  end

  def new
    @book = Book.new
    @categories = Category.all
    @authors = Author.all
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      @categories = Category.all
      @authors = Author.all
      render :new
    end
  end

  def edit
    @categories = Category.all
    @author = Author.all
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      @categories = Category.all
      @authors = Author.all
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_url, notice: 'Book was successfully destroyed.'
  end

  private

  def set_book
    @book = Book.includes(:authors, :category).find(params[:id])
  end

  def book_params
    params.require(:book).permit(:name, :description, :page_count, :contents, :category_id, author_ids: [])
  end
end
