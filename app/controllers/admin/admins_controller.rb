class Admin::AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only

  def index
  end

  def manage_users
    @users = User.all
  end

  def manage_books
    @books = Book.all
  end

  private

  def admin_only
    redirect_to root_path, alert: "Access denied." unless current_user.admin?
  end
end
