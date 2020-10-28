require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it 'image,name,description,category,state_id,delivery_charge_id,delivery_area_id,day_id,priceが存在すれば保存できる' do
      expect(@item).to be_valid
    end
    it 'imageが存在しないと保存できない' do
      @item.image = nil
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'nameが存在しないと保存できない' do
      @item.name = nil
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'descriptionが存在しないと保存できない' do
      @item.description = nil
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'categoryが存在しないと保存できない' do
      @item.category = nil
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'state_idが存在しないと保存できない' do
      @item.state_id = nil
      expect(@item.errors.full_messages).to include("State can't be blank")
    end
    it 'delivery_charge_idが存在しないと保存できない' do
      @item.delivery_charge_id = nil
      expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
    end
    it 'delivery_area_idが存在しないと保存できない' do
      @item.delivery_area_id = nil
      expect(@item.errors.full_messages).to include("Delivery area can't be blank")
    end
    it 'day_idが存在しないと保存できない' do
      @item.day_id = nil
      expect(@item.errors.full_messages).to include("Day can't be blank")
    end
    it 'priceが存在しないと保存できない' do
      @item.price = nil
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが300より小さいとき保存できない' do
      
    end
    it 'priceが9999999より大きいとき保存できない' do
      
    end
    it 'priceが全角数字のとき保存できない' do
      
    end
    it 'priceが半角英字のとき保存できない' do
      
    end
    it 'priceが半角数字のみのとき保存できる' do
      
    end
    it 'userが紐づいていないとき保存できない' do
      
    end
  end
end
