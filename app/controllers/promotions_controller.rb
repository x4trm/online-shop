class PromotionsController < ApplicationController
  before_action :set_promotion, only: [:show, :edit, :update, :destroy, :toggle_active]

  def index
    @promotions = Promotion.all
  end

  def show
  end

  def new
    @promotion = Promotion.new
  end

  def create
    @promotion = Promotion.new(promotion_params)
    if @promotion.save
      redirect_to promotions_path, notice: 'Promotion was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @promotion.update(promotion_params)
      redirect_to promotions_path, notice: 'Promotion was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @promotion.destroy
    redirect_to promotions_path, notice: 'Promotion was successfully destroyed.'
  end

  def toggle_active
    @promotion.update(active: !@promotion.active)
    redirect_to promotions_path, notice: 'Promotion status was successfully updated.'
  end

  private

  def set_promotion
    @promotion = Promotion.find(params[:id])
  end

  def promotion_params
    params.require(:promotion).permit(:title, :description, :image, :active)
  end
end
