class BuyerAddress < ApplicationRecord
  with_options presence: true do
    validates :postal_code, format:{ with:/\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id
    validates :city
    validates :address_number
    validates :phone_number, format:{ with:/\A\d+\z/}
  end
  belongs_to :trade
end
