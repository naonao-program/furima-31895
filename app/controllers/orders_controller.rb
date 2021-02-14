class OrdersController < ApplicationController
  def index
    @order_form = OrderForm.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    binding.pry
    @order_form = Orderform.new(order_form_params)
  end

  private
  def order_params
    params.require(:order).permit(:user_id,:item_id)
  end
end

