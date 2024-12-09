class OrdersController < ApplicationController
  def new
    @order = Order.new
    @cart = current_cart
  end

  def create
    @order = Order.new(order_params)
    @order.cart = current_cart

    if @order.save
      redirect_to order_path(@order), notice: 'Order successfully created!'
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :email, :pay_type)
  end
end
