class CartsController < ApplicationController
  before_action :required_login
  def show
    @items = current_cart.cart_items
  end

  def clean
    current_cart.clean
    redirect_to cart_path(current_cart)
  end
end
