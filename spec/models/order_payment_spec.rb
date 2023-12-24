require 'rails_helper'

RSpec.describe OrderPayment, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_payment = FactoryBot.build(:order_payment, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入情報の保存' do
    context '商品購入情報を保存できるとき' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@order_payment).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @order_payment.building = ''
        expect(@order_payment).to be_valid
      end
    end

    context '商品購入情報を保存できないとき' do
      it 'tokenが空では保存できない' do
        @order_payment.token = ' '
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Token can't be blank")
      end
      it 'postcodeが空では保存できない' do
        @order_payment.postcode = ''
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'prefecture_idが空では保存できない' do
        @order_payment.prefecture_id = ''
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では保存できない' do
        @order_payment.city = ''
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空では保存できない' do
        @order_payment.block = ''
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空では保存できない' do
        @order_payment.phone_number = ''
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁以下では保存できない' do
        @order_payment.phone_number = '123456789'
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include('Phone number is too short')
      end
      it 'postcodeはハイフンがないと保存できない' do
        @order_payment.postcode = '1234567'
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include('Postcode is invalid')
      end
      it 'postcodeは半角英数混合では保存できない' do
        @order_payment.postcode = '123-abcd'
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include('Postcode is invalid')
      end
      it 'postcodeは全角では保存できない' do
        @order_payment.postcode = '１２３-４５６７'
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include('Postcode is invalid')
      end
      it 'prefecture_idは選択していないと保存できない' do
        @order_payment.prefecture_id = 0
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it 'phone_numberは12桁の数字では保存できない' do
        @order_payment.phone_number = '090123456789'
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberは半角英数混合では保存できない' do
        @order_payment.phone_number = 'abc123456789'
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberは全角では保存できない' do
        @order_payment.phone_number = '０９０１２３４５６７８'
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include('Phone number is invalid')
      end
      it 'user_id（購入者）が空だと保存できない' do
        @order_payment.user_id = nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("User can't be blank")
      end
      it 'item_id（購入商品）が空だと保存できない' do
        @order_payment.item_id = nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
