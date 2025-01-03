class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
  before_action :check_admin, only: [:edit, :update, :destroy, :index]

  def index
    @categories = Category.all
  end

  def show
    @books = @category.books
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  private

  def set_category
    @category = Category.find_by!(slug: params[:slug])
  end

  def category_params
    params.require(:category).permit(:name, :slug)
  end

  def check_admin
    redirect_to root_path, alert: 'You are not authorized to perform this action.' unless current_user.admin? 
  end
end
