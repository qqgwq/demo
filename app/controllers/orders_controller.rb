class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.add_item(current_cart)
    if @order.save
      current_cart.clean
      redirect_to order_path(@order)
    else
      render 'new'
    end
  end

  def show
    @order = current_user.orders.find(params[:id])
  end


  private
  def order_params
    params.require(:order).permit(:order_address, :order_phone, :order_name)
  end
end
