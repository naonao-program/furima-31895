class OrdersController < ApplicationController
  def index
    @order_form = OrderForm.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    @order_form = OrderForm.new(order_form_params)
    @item = Item.find(params[:item_id])
  end

  private
  def order_form_params
    params.require(:order_form).permit(:postal_code, :region_id, :municipality, :address, :building_name, :phone_number, :order_id).merge(user_id: current_user.id, item_id: @item.id)
  end
end

