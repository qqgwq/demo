class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :login?, :current_cart

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_cart
    @current_cart ||= find_cart
  end

  def find_cart
    cart = Cart.find_by(id: session[:cart_id])
    if cart.blank?
      cart = Cart.create
    end
    session[:cart_id] = cart.id
    return cart
  end

  def login?
    !!current_user
  end

  def required_login
    unless login?
      flash[:notice] = 'Please login'
      redirect_to login_path
    end
  end

  def login_as(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def logout
    session[:user_id] = nil
    @current_user = nil
  end
end
