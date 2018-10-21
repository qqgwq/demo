class CartsController < ApplicationController
  def show
    @items = current_cart.cart_items
  end

  def clean
    current_cart.clean
    redirect_to cart_path
  end
end
