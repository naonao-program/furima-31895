require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe '商品購入' do
    context '購入がうまくできるとき' do
      it "空欄がなければ登録ができる" do
        expect(@order_form).to be_valid
      end
    end
    context '購入がうまくいかないとき' do
      it "postal_codeが空では購入できない" do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end

      it "postal_codeがひらがなであると購入できない" do
        @order_form.postal_code = "あいうえおかきく"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code is invalid")
      end

      it "postal_codeがカタカナであると購入できない" do
        @order_form.postal_code = "アイウエオカキク"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code is invalid")
      end

      it "postal_codeが漢字であると購入できない" do
        @order_form.postal_code = "一二三四五六七八"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code is invalid")
      end

      it "postal_codeが8桁未満であると購入できない" do
        @order_form.postal_code = "11"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code is invalid")
      end

      it "postal_codeがハイフンがないと購入できない" do
        @order_form.postal_code = "11111111"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code is invalid")
      end

      it "postal_codeが全角であると購入できない" do
        @order_form.postal_code = "１１１ー１１１１"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code is invalid")
      end

      it "region_idが[1]では購入できない" do
        @order_form.region_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Region must be other than 1')
      end

      it "municipalityが空では購入できない" do
        @order_form.municipality = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Municipality can't be blank")
      end

      it "addressが空では購入できない" do
        @order_form.address = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end

      it "phone_numberが空では購入できない" do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it "phone_numberが全角では登録できない" do
        @order_form.phone_number = "０１２３４５６７８９"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end

      it "phone_numberが英語では登録できない" do
        @order_form.phone_number = "aaaaaaaaa"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end

      it "phone_numberがひらがなでは登録できない" do
        @order_form.phone_number = "あいうえおかきくけこ"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end

      it "phone_numberがカタカナでは登録できない" do
        @order_form.phone_number = "アイウエオカキクケコ"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end

      it "phone_numberが漢字では登録できない" do
        @order_form.phone_number = "〇一二三四五六七八九"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end
      
      it "phone_numberがハイフンがあると登録できない" do
        @order_form.phone_number = "000-0000-0000"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end

      it "phone_numberが12桁以上では登録できない" do
        @order_form.phone_number = "123456789012"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end
      
      it "tokenが空では購入できないこと" do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end