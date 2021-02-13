class OrdersController < ApplicationController
  def index
    @order = Order.new
  end
  
  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      return redirect_root_path
    else
      render 'index'
    end
  end

  private
  def order_params
    params.require(:order).permit(:user_id,:item_id)
  end
end

