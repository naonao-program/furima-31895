require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
end

describe '商品出品' do
  context '商品出品がうまくいくとき' do
    it 'すべての項目が正しく入力されていた場合は出品できる' do
      expect(@item).to be_valid
    end
  end

  context '商品出品がうまくいかないとき' do
    it 'imageが空であれば出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'nameが空では出品できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'descriptionが空では出品できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'category_idが[1]では出品できない' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it 'condition_idが[1]では出品できない' do
      @item.condition_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end
    it 'postage_idが[1]では出品できない' do
      @item.postage_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage must be other than 1")
    end
    it 'region_idが[1]では出品できない' do
      @item.region_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Region must be other than 1")
    end
    it 'shipping_date_idが[1]では出品できない' do
      @item.shipping_date_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping date must be other than 1")
    end
    it 'priceが空では出品できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが英字では出品できない' do
      @item.price = "abC"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number","Price is not included in the list")
    end
    it 'priceがひらがなでは出品できない' do
      @item.price = 'あいう'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number","Price is not included in the list")
    end
    it 'priceがカタカナでは出品できない' do
      @item.price = 'アイウ'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number","Price is not included in the list")
    end
    it 'priceが記号では出品できない' do
      @item.price = '&%#'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number","Price is not included in the list")
    end
    it 'priceが300円以下では出品できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it 'priceが10,000,000円以上では出品できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it 'priceが全角数字では出品できない' do
      @item.price = '４００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
  end
end
end