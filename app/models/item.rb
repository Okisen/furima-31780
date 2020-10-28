class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :day
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id,         numericality: {other_than: 1, message: "can't be blank"}
    validates :state_id,            numericality: {other_than: 1, message: "can't be blank"}
    validates :delivery_charge_id,  numericality: {other_than: 1, message: "can't be blank"}
    validates :delivery_area_id
    validates :day_id,              numericality: {other_than: 1, message: "can't be blank"}
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end
end
