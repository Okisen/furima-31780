class ItemTrade
  include ActiveModel::Model
  attr_accessor :token, :price, :user_id, :item_id, :postal_code, :prefecture_id, :city, :address_number, :building, :phone_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id
    validates :city
    validates :address_number
    validates :phone_number, format: { with: /\A\d+\z/, maxlength: 11 }
    validates :phone_number, length: { maximum: 11 }
    validates :token
  end
  def save
    trade = Trade.create(user_id: @user_id, item_id: @item_id)
    BuyerAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address_number: address_number, building: building, phone_number: phone_number, trade_id: trade.id)
  end
end
