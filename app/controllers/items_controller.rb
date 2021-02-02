class ItemsController < ApplicationController
  def index
  end

  def new
    @items = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :postage_id, :region_id, :shipping_date_id, :price, :user_id)
  end
end
