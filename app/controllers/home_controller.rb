class HomeController < ApplicationController
  def index
    @promotions = Promotion.active
    @bestsellers = Book.where(bestseller: true).limit(3)
    @recommended = Book.where(recommended: true).limit(3)
  end
end
