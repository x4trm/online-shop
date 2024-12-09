module Admin
  class OrdersController < ApplicationController
    before_action :authenticate_user!
    before_action :admin_only

    def index
      @orders = Order.all
    end

    def show
      @order = Order.find(params[:id])
    end

    private

    def admin_only
      redirect_to root_path, alert: "Access denied." unless current_user.admin?
    end
  end
end
