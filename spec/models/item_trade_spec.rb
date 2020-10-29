require 'rails_helper'

RSpec.describe ItemTrade, type: :model do
  describe '購入情報の保存' do
    before do
      @item_trade = FactoryBot.build(:item_trade)
    end

    it '全ての値が正しく入力されていれば保存できること' do
      expect(@item_trade).to be_valid
    end
    it 'tokenが空だと保存できないこと' do
      @item_trade.token = nil
      @item_trade.valid?
      expect(@item_trade.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空だと保存できないこと' do
      @item_trade.postal_code = nil
      @item_trade.valid?
      expect(@item_trade.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeの4文字目が-でないとき保存できないこと' do
      @item_trade.postal_code = "1234567"
      @item_trade.valid?
      expect(@item_trade.errors.full_messages).to include("Postal code is invalid")
    end
    it 'postal_codeが全角数字で入力されている保存できないこと' do
      @item_trade.postal_code = "１２３-４５６７"
      @item_trade.valid?
      expect(@item_trade.errors.full_messages).to include("Postal code is invalid")
    end
    it 'postal_codeが半角数字3,-,半角数字4の並びで入力されていると保存できること' do
      @item_trade.postal_code = "123-4567"
      expect(@item_trade).to be_valid
    end
    it 'prefecture_idが空だと保存できないこと' do
      @item_trade.prefecture_id = nil
      @item_trade.valid?
      expect(@item_trade.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空だと保存できないこと' do
      @item_trade.city = nil
      @item_trade.valid?
      expect(@item_trade.errors.full_messages).to include("City can't be blank")
    end
    it 'address_numberが空だと保存できないこと' do
      @item_trade.address_number = nil
      @item_trade.valid?
      expect(@item_trade.errors.full_messages).to include("Address number can't be blank")
    end
    it 'buildingが空でも保存できること' do
      @item_trade.building = nil
      expect(@item_trade).to be_valid
    end
    it 'phone_numberが空だと保存できないこと' do
      @item_trade.phone_number = nil
      @item_trade.valid?
      expect(@item_trade.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが全角数字だと保存できないこと' do
      @item_trade.phone_number = "０９０１２３４５６７８"
      @item_trade.valid?
      expect(@item_trade.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_numberが12字以上だと保存できないこと' do
      @item_trade.phone_number = "090123456789012345"
      @item_trade.valid?
      expect(@item_trade.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end
    it 'phone_numberが半角数字11文字だと保存できること' do
      @item_trade.phone_number = "09012345678"
      expect(@item_trade).to be_valid
    end
  end
end
