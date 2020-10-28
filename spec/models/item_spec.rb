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
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'nameが存在しないと保存できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'descriptionが存在しないと保存できない' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'category_idが存在しないと保存できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'category_idが1のとき保存できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'state_idが存在しないと保存できない' do
      @item.state_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("State can't be blank")
    end
    it 'state_idが1のとき保存できない' do
      @item.state_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("State can't be blank")
    end
    it 'delivery_charge_idが存在しないと保存できない' do
      @item.delivery_charge_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
    end
    it 'delivery_charge_idが1のとき保存できない' do
      @item.delivery_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
    end
    it 'delivery_area_idが存在しないと保存できない' do
      @item.delivery_area_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery area can't be blank")
    end
    it 'day_idが存在しないと保存できない' do
      @item.day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Day can't be blank")
    end
    it 'day_idが1のとき保存できない' do
      @item.day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Day can't be blank")
    end
    it 'priceが存在しないと保存できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが300より小さいとき保存できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it 'priceが300以上で保存できる' do
      @item.price = 300
      expect(@item).to be_valid
    end
    it 'priceが9,999,999より大きいとき保存できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
    it 'priceが9,999,999以下で保存できる' do
      @item.price = 9_999_999
      expect(@item).to be_valid
    end
    it 'priceが全角数字のとき保存できない' do
      @item.price = '１２３４５'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it 'priceが半角英字のとき保存できない' do
      @item.price = 'abcde'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it 'priceが半角数字のみのとき保存できる' do
      @item.price = 500
      expect(@item).to be_valid
    end
    it 'userが紐づいていないとき保存できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end
