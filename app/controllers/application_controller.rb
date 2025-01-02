class ApplicationController < ActionController::Base
  helper_method :current_cart

  def current_cart
    if user_signed_in?
      @current_cart ||= Cart.find_or_create_by(user: current_user)
    else
      @current_cart ||= Cart.find_or_create_by(id: session[:cart_id])
      session[:cart_id] = @current_cart.id if session[:cart_id].nil?
    end
    @current_cart
  end
end
