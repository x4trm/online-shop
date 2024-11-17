class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
  before_action :check_admin, only: [:edit, :update, :destroy, :index]

  def index
    @books = Book.includes(:authors, :category).all
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
    @book.authors.build if @book.authors.empty?
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      @categories = Category.all
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_url, notice: 'Book was successfully destroyed.'
  end

  private

  def set_book
    @book = Book.includes(:authors, :category).find_by(slug: params[:slug])
  end

  def book_params
    params.require(:book).permit(:name, :description, :page_count, :contents, :category_id, :slug, :price, :image, :recommended, :bestseller, author_ids: [])
  end

  def check_admin
    redirect_to root_path, alert: 'You are not authorized to perform this action.' unless current_user.admin? 
  end
end
