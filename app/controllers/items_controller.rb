class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :redirect_root_path, only: [:edit, :update]
  def index
    @items = Item.includes(:user).order('created_at DESC')
    @orders = Order.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @orders = Order.all
    @items = Item.includes(:user)
  end

  def edit
    if Order.exists?(item_id: @item.id)
      redirect_to_root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :postage_id, :region_id, :shipping_date_id,
                                 :price, :user_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def redirect_root_path
    redirect_to root_path unless current_user.id == @item.user.id
  end
end
