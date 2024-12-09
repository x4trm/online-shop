class ApplicationController < ActionController::Base
  helper_method :current_cart

  private

  def current_cart
    if user_signed_in?
      @current_cart ||= Cart.find_or_create_by(user_id: current_user.id)
    else
      @current_cart ||= Cart.find_or_create_by(id: session[:cart_id], user_id: nil)
      session[:cart_id] = @current_cart.id
    end
  end
end
