class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def admin_required
    if !current_user.admin?
      redirect_to '/', alert:'你不是管理员'
    end
  end

  helper_method :current_cart

  def current_cart
    @current_cart ||= find_cart
  end

  def find_cart
    cart = Cart.find_by(id: session[:id])
    if cart.blank?
      cart = Cart.create
    end
    session[:id] = cart.id
    return cart
  end
end
