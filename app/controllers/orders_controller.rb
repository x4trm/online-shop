class OrdersController < ApplicationController
  def new
    @order = Order.new
    @cart = current_cart
  end

  def create
    @order = Order.new(order_params)
    @order.cart = current_cart

    if @order.save
      current_cart.cart_items.destroy_all
      redirect_to confirmation_order_path(@order), notice: 'Order successfully created!'
    else
      render :new
    end
  end

  def confirmation
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :email, :pay_type, :total_price)
  end
end
